jQuery(".dad_star").live("click", function(){
    var theone = jQuery(this).parent().parent().hasClass("main");
    var file = jQuery(this).parent().parent().parent().attr("title");

    jQuery("#dropbox").find(".uploaded").removeClass("main");
    jQuery("#dropbox").find(".dad_star").attr("src", "/wp-content/plugins/budkutil/js/img-up/assets/img/star-dark.png");

    if(theone == false)
    {
        jQuery(this).parent().parent().addClass("main");
        jQuery(this).attr("src", "/wp-content/plugins/budkutil/js/img-up/assets/img/star.png");
        jQuery("input[name=main_attach]").val(file);
    }
});

jQuery(".dad_close").live("click", function(){
  
      var adr = jQuery(this).parent().find(".upedimg").attr("title");
      
      jQuery.get("/wp-content/plugins/budkutil/js/do_kose.php", { time: jQuery('#edit_timestamp').val(), img: adr, klic: "f9dks"} ,
      function(data){
        //alert("Data Loaded: " + data);
      });
  
    jQuery(this).parent().parent().parent().fadeOut( function() {
        jQuery(this).parent().parent().parent().toggle("slow");
    });
}); 

var isFileAPIEnabled = function() {
  return !!window.FileReader;
};

if(isFileAPIEnabled())
    var msg = "Obrázky vyberte kliknutím na tlačítko níže nebo přetáhnutím obrázku z disku na tuto plochu. <br /><i>(podporované formáty: PNG, JPG, GIF)</i>";
else
    var msg = "Obrázky vyberte kliknutím na tlačítko níže. <br /><i>(podporované formáty: PNG, JPG, GIF)</i>";

jQuery("#dropbox > .message").html(msg);

jQuery("#btn_vybrat_soubor").click( function() {
    jQuery("#one-specific-file").click();
});

jQuery("#list1").dragsort({ dragSelector: "li", dragBetween: true, dragEnd: saveOrder, placeHolderTemplate: "<li class=\'placeHolder\'></li>" });

function saveOrder() {
    var data = jQuery("#list1 li").map(function() { return jQuery(this).find(".upedimg").attr("title"); }).get();
    jQuery("input[name=poradi_attachs]").val(data.join("|"));
};

jQuery("#one-specific-file").ajaxfileupload({
  "action": "/wp-content/plugins/budkutil/js/nahraj_obrazek.php?way=input&time="+jQuery("#edit_timestamp").val()
});

jQuery(document).ready(function(){
    jQuery("#browser").treeview({
        toggle: function() {
            console.log("%s was toggled.", jQuery(this).find(">span").text());
        }
    });
    
    jQuery("#add").click(function() {
        var branches = jQuery("<li><span class='folder'>New Sublist</span><ul>" + 
            "<li><span class='file'>Item1</span></li>" + 
            "<li><span class='file'>Item2</span></li></ul></li>").appendTo("#browser");
        jQuery("#browser").treeview({
            add: branches
        });
    });
});


// scripts down

function format(state) {
            var originalOption = state.element;
            //if (!state.id) return state.text; // optgroup
            return '<img class="nahled_hodnota" src="/wp-content/plugins/budkutil/up_img/' + jQuery(originalOption).attr('alt') + '"/>' + state.text;
        }

        jQuery('.attribute_taxonomy').live('change', function () {

            var select_element  = jQuery(this);

            if(select_element.val() != "")
            {
                var label_text      = select_element.find('option:selected').html()
                var sada            = select_element.val();
                
                var aktivni = new Array();
                   for(i=0; i <= jQuery('.nazev_sady').length; i++)
                        if(jQuery('.nazev_sady:eq('+i+')').attr('id') != null)
                            aktivni.push(jQuery('.nazev_sady:eq('+i+')').attr('id'));                    

                jQuery.get('/wp-content/plugins/budkutil/js/product_parametry.php', { get_sada: sada, key: 'fU7i2m', get_aktivni: aktivni }, function(data) { 
                    var vyber_hodnoty = data;

                    jQuery.get('/wp-content/plugins/budkutil/js/product_parametry.php', { get_aktivni: aktivni }, function(data) { 
                        var vnuk = data;

                        select_element.after(vyber_hodnoty);  
                        select_element.parent().after(vnuk);

                        select_element.parent().find('.vyber_hodnoty').select2({
                            formatResult: format,
                            formatSelection: format,
                            escapeMarkup: function(m) { return m; }
                        });

                        select_element.replaceWith(label_text);
                    });  
                });
            }
        });     

        jQuery('.delete_sada a').live('click', function () {  
            jQuery(this).parent().parent().parent().remove();
        }); 

jQuery('#novy_produkt_form').validate({
        rules: {
          novy_produkt_nazev: {
            minlength: 2
          },
          novy_produkt_popis: {
            minlength: 20,
            maxlength: 500
          },
          novy_produkt_cena: {
            digits: true,
            minlength: 1
          },
          novy_produkt_ks: {
            number: true,
            minlength: 1
          }
        },
            highlight: function(element) {
                jQuery(element).closest('.control-group').removeClass('success').addClass('error');
            },
            success: function(element) {
                element.addClass('valid').closest('.control-group').removeClass('error').addClass('success');
            }
      });

function preload(arrayOfImages) {
    jQuery(arrayOfImages).each(function(){
        jQuery('<img/>')[0].src = this;
    });
}

preload([
    '/wp-content/plugins/budkutil/js/validate/valid.png',
]);