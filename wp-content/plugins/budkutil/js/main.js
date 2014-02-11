jQuery('.like_icon').click( function() {
	var unix_ts = Math.round((new Date()).getTime() / 1000),
	idecko = jQuery('input[name=add-to-cart]').val();

	jQuery.get("/wp-content/plugins/budkutil/js/like.php", { time: unix_ts, pid: idecko} ,
      function(data){
      	
      	var like_wrapper = jQuery('.like_wrapper'),
      	num_wrapper = jQuery('.like_num');

      	var num = num_wrapper.html();

      	switch (data)
		{
			case "liked":
		  	like_wrapper.addClass('liked');
        	num_wrapper.html(num*1+1*1);
		  	break;

			case "annulled":
		  	like_wrapper.removeClass('liked');
        	num_wrapper.html(num-1);
        	break;
		}
    });
});