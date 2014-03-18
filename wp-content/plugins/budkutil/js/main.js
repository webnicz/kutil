jQuery('.like_icon').click( function() {
	var this_like = jQuery(this);

	var unix_ts = Math.round((new Date()).getTime() / 1000),
	idecko = this_like.next().val();

	if(this_like.hasClass('icon-thumbs-up')){
		this_like.removeClass('icon-thumbs-up');
		this_like.addClass('icon-thumbs-down');
	}
	else {
		this_like.removeClass('icon-thumbs-down');
		this_like.addClass('icon-thumbs-up');
	}


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
			  	like_wrapper.removeClass('icon-thumbs-up');
			  	like_wrapper.find('i').attr('class','icon-thumbs-down');
		    	//num_wrapper.html(num*1+1*1);
			  	break;

				case "annulled":
			  	like_wrapper.removeClass('liked');
			  	like_wrapper.removeClass('icon-thumbs-down');
			  	like_wrapper.find('i').attr('class','icon-thumbs-up');
		    	//num_wrapper.html(num-1);
		    	break;

		    	case "Login":
			  	alert('Pro hlasování musíte být přihlášen.');
		    	//num_wrapper.html(num*1+1*1);
			  	break;
			}
	    });
	}
});