jQuery('.like_icon').click( function() {
	var this_like = jQuery(this);

	var unix_ts = Math.round((new Date()).getTime() / 1000),
	idecko = this_like.closest('input[name=add-to-cart]').val();

	if(!this_like.closest('.like_wrapper').hasClass('disable'))
	{
		jQuery.get("/wp-content/plugins/budkutil/js/like.php", { time: unix_ts, pid: idecko} ,
		function(data){
		  	
		  	var like_wrapper = this_like.closest('.like_wrapper'),
		  	num_wrapper = like_wrapper.find('.like_num');

		  	var num = num_wrapper.html();

		  	switch (data)
			{
				case "liked":
			  	like_wrapper.addClass('liked');
			  	like_wrapper.find('i').attr('class','icon-thumbs-down');
		    	//num_wrapper.html(num*1+1*1);
			  	break;

				case "annulled":
			  	like_wrapper.removeClass('liked');
			  	like_wrapper.find('i').attr('class','icon-thumbs-up');
		    	//num_wrapper.html(num-1);
		    	break;
			}
	    });
	}
});