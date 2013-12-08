jQuery(function() {

  jQuery(".numbers-row").append('<div class="inc button">+</div><div class="dec button">-</div>');

  jQuery(".button").on("click", function() {

    var jQuerybutton = jQuery(this);
    var oldValue = jQuerybutton.parent().find("input").val();

    if (jQuerybutton.text() == "+") {
  	  var newVal = parseFloat(oldValue) + 1;
  	} else {
	   // Don't allow decrementing below zero
      if (oldValue > 0) {
        var newVal = parseFloat(oldValue) - 1;
	    } else {
        newVal = 0;
      }
	  }

    jQuerybutton.parent().find("input").val(newVal);

  });

});