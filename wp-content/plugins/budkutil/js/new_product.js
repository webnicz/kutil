jQuery(window)._scrollable();

jQuery(".dad_star").live("click", function(){
    var theone = jQuery(this).parent().parent().hasClass("main");
    var file = jQuery(this).parent().parent().parent().attr("title");

    jQuery("#dropbox").find(".uploaded").removeClass("main");
    jQuery("#dropbox").find(".dad_star").removeClass("active");
    jQuery("input[name=main_attach]").val('');

    if(theone == false)
    {
        jQuery(this).parent().parent().addClass("main");
        jQuery("#dropbox").find(".dad_star").addClass("active");
        jQuery("input[name=main_attach]").val(jQuery(this).index('.dad_star'));
    }
});

jQuery(".dad_close").live("click", function(){
  
      var adr = jQuery(this).closest(".upedimg").attr("title");
      
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
  if(jQuery('.uploaded').length <= 10)
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
    jQuery('.miller-container').taxonomyBrowser({
      columns : 3,
      start   : jQuery('input[name=vybrana_kategorie]').val() 
    });

    /*jQuery("#browser").treeview({
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
    });*/
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

function error_msg(msg, obj) {
  var id       = (!obj.attr('name')) ? obj.attr('id') : obj.attr('name');
  var template = '<div class="error_msg error_'+id+'"><i class="icon-remove-sign"></i> '+msg+'</div>'; //<i class="icon-ok-sign"></i>
  jQuery('.error_'+id).show();

  if(jQuery('.error_'+id).length == 0)
    jQuery(template).insertBefore(obj);
}

function scrollup(obj) {
  jQuery.scrollTo(obj, 1000);
}

jQuery('#novy_produkt_form').submit( function () {
  jQuery('.error_msg').hide();

  var pole_nazev      = jQuery('input[name=novy_produkt_nazev]'); 
  var pole_popis      = jQuery('#novy_produkt_popis_ifr'); 
  var pole_kateogire  = jQuery('input[name=vybrana_kategorie]'); 
  var pole_cena       = jQuery('input[name=novy_produkt_cena]'); 
  var pole_ks         = jQuery('input[name=novy_produkt_ks]'); 
  var dropbox         = jQuery('#dropbox'); 

  var nazev       = pole_nazev.val();
  var popis       = pole_popis.contents().find('#tinymce').html();
  var kategorie   = pole_kateogire.val();
  var cena        = pole_cena.val();
  var kusy        = pole_ks.val();
  var obrazek     = dropbox.find('.uploaded').length;

  if(nazev.length < 3) {
    scrollup(pole_nazev);
    error_msg('Zadejte prosím název Vašeho zboží', pole_nazev);
    return false;
  }
  if(popis.length <= 30) {
    scrollup(jQuery('#wp-novy_produkt_popis-wrap'));
    error_msg('Zadejte prosím popis zboží', jQuery('#wp-novy_produkt_popis-wrap'));
    return false;
  }
  if(kategorie.length == 0) {
    scrollup(jQuery('.miller-container').prev());
    error_msg('Vyberte kategorii zboží', jQuery('.miller-container').prev());
    return false;
  }
  if(cena.length == 0) {
    scrollup(pole_cena);
    error_msg('Zadejte prosím cenu Vašeho zboží', pole_cena);
    return false;
  }
  if(kusy.length == 0) {
    scrollup(pole_ks);
    error_msg('Zadejte prosím kolik kusů nabízíte', pole_ks);
    return false;
  }
  if(obrazek == 0) {
    scrollup(dropbox.prev());
    error_msg('Nahrajte prosím alespoň jeden orbázek Vašeho zboží', dropbox.prev());
    return false;
  }

  jQuery('input[name=submited]').val('submited');

  jQuery('#novy_produkt_popis_ifr').contents().find('a').each(function() { 
      var odkaz = jQuery(this),
      link_href = odkaz.attr('href'),
      domena = jQuery(this).prop('origin');
      
      odkaz.attr('href',link_href.replace(domena,''));
  });
  
  return true;
});

 jQuery("input[name=novy_produkt_cena],input[name=novy_produkt_ks]").keydown(function(event) {

    var regex = new RegExp("^[0-9]+$");
    var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
    
console.log(event.keyCode);

    if (event.metaKey || event.ctrlKey || regex.test(key) 
    || jQuery.inArray(event.keyCode,[46,8,9,27,13]) !== -1
    || jQuery.inArray(event.keyCode,[96,97,98,99,100,101,102,103,104,105]) >= 0) 
    {
      if(jQuery.inArray(event.keyCode,[48,49,50,51,52,53,54,55,56,57]) >= 0 && !event.shiftKey)
      {
        event.preventDefault();
        return false;
      }

      return true;
    }
    else
    {
       event.preventDefault();
            var template = '<div class="error_msg_tiny error_keycode" style="display: none"><i class="icon-remove-sign"></i> Lze použít pouze číslice</div>'; //<i class="icon-ok-sign"></i>

            if(jQuery('.error_keycode').length == 0)
              jQuery(template).appendTo(jQuery('input[name=novy_produkt_cena]').parent());
            jQuery('.error_keycode').slideDown().finish().delay('1500').slideUp();

       return false;
    }
});

/*jQuery('#novy_produkt_form').validate({
        rules: {
          novy_produkt_nazev: {
            minlength: 2
          },
          novy_produkt_popis: {
            minlength: 5,
            maxlength: 5000
          },
          novy_produkt_cena: {
            number: true,
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
      });*/

function preload(arrayOfImages) {
    jQuery(arrayOfImages).each(function(){
        jQuery('<img/>')[0].src = this;
    });
}

preload([
    '/wp-content/plugins/budkutil/js/validate/valid.png',
]);

jQuery('#list1').bind("DOMSubtreeModified",function(){
  var index = jQuery('.main').parent().parent().parent().index('.preview');
  jQuery("input[name=main_attach]").val(index);

  if(jQuery('.uploaded').length == 10)
    jQuery('#btn_vybrat_soubor').addClass('disable');
  else
    jQuery('#btn_vybrat_soubor').removeClass('disable');

  saveOrder();
});

jQuery("#tagy").select2({
    placeholder: "",
    minimumInputLength: 0,
    maximumInputLength: 20,
     multiple: true,
     tags:["red", "green", "blue"],
    ajax: { 
        url: "/wp-content/plugins/budkutil/js/tagy.php",
         dataType: "json",
         width: "element",
        data: function (term, page) {
            return {
                q: term
            };
        },
        results: function (data, page) {
            return { results: data };
        }
    }
});

function number_format (number, decimals, dec_point, thousands_sep) {
  number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ' ' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? ',' : dec_point,
    s = '',
    toFixedFix = function (n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

jQuery(function() {
  jQuery("input[name=novy_produkt_cena]").trigger('keyup');
});

jQuery("input[name=novy_produkt_cena]").keyup( function () {
    var cena = jQuery(this).val().replace(",", ".");
    var koeficient = jQuery("input[name=koeficient]").val().replace(",", ".")/100;

    var provize = cena*koeficient;
    var koncova = (cena*1+provize*1);

    jQuery('#vypocet_provize').html(number_format(provize));
    jQuery('#vypocet_koncove_ceny').html(number_format(koncova));
});