(function($) {
    $.fn.ajaxfileupload = function(options) {
        var settings = {
          params: {},
          action: '',
          onStart: function() { postup(); console.log('starting upload'); console.log(this); },
          onComplete: function(response) { nahled(response); console.log('got response: '); console.log(response); console.log(this); },
          onCancel: function() { console.log('cancelling: '); console.log(this); },
          validate_extensions : true,
          valid_extensions : ['gif','png','jpg','jpeg'],
          submit_button : null
        };

        var uploading_file = false;

        var postup = function() {

          var message = $("#dropbox > .message");
          if(message.is(':visible'))
            message.fadeOut();

          var template = '<li><div class="preview done" style="display: none">'+
                          '<span class="imageHolder"></span>'+
                          '<div class="progressHolder">'+
                            '<div class="progress"></div>'+
                          '</div>'+
                        '</div></li>'; //<img src="/wp-content/plugins/budkutil/js/img-up/assets/img/close.png" class="dad_close" alt="" />

          $('#list1').append(template);

          $('.preview:last').fadeIn( function() {
            $(this).find('.progress').width('0%').animate({width: '75%'}, 1500);
          });
        }

        var nahled = function(response) {
          var nazev       = $('#one-specific-file').val();
          var timestamp   = jQuery('#edit_timestamp').val()

          if(typeof response.url === 'undefined')
            var cesta = "/wp-content/plugins/budkutil/js/"+timestamp+"_"+nazev;
          else
            var cesta = response.url.replace(".", "/wp-content/plugins/budkutil/js/");

          var lista = '<div class="toolbar">'+
            '<i class="icon-trash dad_close"></i>'+
            '<i class="icon-star dad_star"></i>'+
          '</div>';

          $('.preview:last').find('.imageHolder').append('<img src="'+cesta+'" /><a class="upedimg" title="'+nazev+'"><span class="uploaded">'+lista+'<img src="/wp-content/plugins/budkutil/js/img-up/assets/img/done.png" class="dad_status" style="display: none" alt="" /></span></a>')
          
          $('.preview:last > .progress').promise().done(function() {
            $('.preview:last').find('.progress').finish().stop(true, true).width('75%').animate({width: '100%'}, 500, function() {
              $(this).parent().fadeOut();
            });
          });
        }

        if ( options ) { 
          $.extend( settings, options );
        }

        return this.each(function() {
          var $element = $(this);
       

          if($element.data('ajaxUploader-setup') === true) return;

          $element.change(function()
          {
            
            uploading_file = false;

            
            if (settings.submit_button == null)
            {
              upload_file();
            }
          });

          if (settings.submit_button == null)
          {
            
          } else
          {
            settings.submit_button.click(function(e)
            {
              
              e.preventDefault();
              
              
              if (!uploading_file)
              {
                upload_file();
              }
            });
          }

          var upload_file = function()
          {
            if(jQuery('.uploaded').length < 10)
            {

              var soubory = jQuery('input[name=pic]').get(0).files;
              var pocet = soubory.length;

              for(var i = 0; i < pocet; i++)
                console.log(soubory[i]);

              if($element.val() == '') return settings.onCancel.apply($element, [settings.params]);

              
              var ext = $element.val().split('.').pop().toLowerCase();
              if(true === settings.validate_extensions && $.inArray(ext, settings.valid_extensions) == -1)
              {
                
                settings.onComplete.apply($element, [{status: false, message: 'Povolené formáty: ' + settings.valid_extensions.join(', ') + '.'}, settings.params]);
              } else
              { 
                uploading_file = true;
                
                wrapElement($element);

                
                
                var ret = settings.onStart.apply($element, [settings.params]);

                
                if(ret !== false)
                {
                  $element.parent('form').submit(function(e) { e.stopPropagation(); }).submit();
                }
              }
            }
            else
            {
              alert('Maximální počet nahraných obrázků je 10.');
            }
          };

          
          $element.data('ajaxUploader-setup', true);

          /*
          
          
          */
          var handleResponse = function(loadedFrame, element) {
            var response, responseStr = loadedFrame.contentWindow.document.body.innerHTML;
            try {
              
              response = JSON.parse(responseStr);
            } catch(e) {
              response = responseStr;
            }

            
            element.siblings().remove();
            element.unwrap();

            uploading_file = false;

            
            settings.onComplete.apply(element, [response, settings.params]);
          };

          /*
          
          
          
          
          */
          var wrapElement = function(element) {
            
            var frame_id = 'ajaxUploader-iframe-' + Math.round(new Date().getTime() / 1000)
            $('body').after('<iframe width="0" height="0" style="display:none;" name="'+frame_id+'" id="'+frame_id+'"/>');
            $('#'+frame_id).load(function() {
              handleResponse(this, element);
            });

            
            element.wrap(function() {
              return '<form action="' + settings.action + '" method="POST" enctype="multipart/form-data" target="'+frame_id+'" />'
            })
            
            .before(function() {
              var key, html = '';
              for(key in settings.params) {
                var paramVal = settings.params[key];
                if (typeof paramVal === 'function') {
                  paramVal = paramVal();
                }
                html += '<input type="hidden" name="' + key + '" value="' + paramVal + '" />';
              }
              return html;
            });
          }



        });
      }
})( jQuery )
