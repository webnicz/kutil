jQuery(function(){
	
	var dropbox 	= jQuery('#dropbox'),
		timestamp 	= jQuery('#edit_timestamp').val(),
		message 	= jQuery('.message', dropbox),
		list1		= jQuery('#list1');
	
	dropbox.filedrop({
		// The name of the jQuery_FILES entry:
		paramname:'pic',
		
		maxfiles: 10,
    	maxfilesize: 5,
		url: '/wp-content/plugins/budkutil/js/nahraj_obrazek.php?time='+timestamp+'&n='+jQuery('.uploaded').length,
		edit_timestamp: timestamp, 
		
		uploadFinished:function(i,file,response){
			jQuery.data(file).addClass('done');
			jQuery('.done').find('.progress').fadeOut();
			jQuery('.done').find('.progressHolder').fadeOut();
			jQuery.data(file).find('.uploaded').wrap("<a class=\"upedimg\" title='"+file.name+"'></a>");
			// response is the JSON object that post_file.php returns
		},
		
    	error: function(err, file) {
			switch(err) {
				case 'BrowserNotSupported':
					showMessage('Používáte starou verzi prohlížeče, která nepodporuje nahrávání souborů pomocí HTML5.');
					break;
				case 'TooManyFiles':
					alert('Vybráno příliš mnoho souborů. Maximálně lze vybrat 10 souborů najednou.');
					break;
				case 'FileTooLarge':
					alert(file.name+'  příliš velký! Maximální povolená velikost souboru jsou 5MB.');
					break;
				default:
					break;
			}
		},
		
		// Called before each upload is started
		beforeEach: function(file){
			if(!file.type.match(/^image\//)){
				alert('Povoleny jsou pouze obrázky!');
				
				// Returning false will cause the
				// file to be rejected
				return false;
			}
		},
		
		uploadStarted:function(i, file, len){
			createImage(file);
		},
		
		progressUpdated: function(i, file, progress) {
			jQuery.data(file).find('.progress').width(progress);
		}
    	 
	});

	var lista = '<div class="toolbar">'+
            '<i class="icon-trash dad_close"></i>'+
            '<i class="icon-star dad_star"></i>'+
          '</div>';
	
	var template = '<li><div class="preview">'+
						'<span class="imageHolder">'+
							'<img class="dad_nahled" />'+
							'<span class="uploaded">'+lista+'<img src="/wp-content/plugins/budkutil/js/img-up/assets/img/done.png" class="dad_status" style="display: none" alt="" /></span>'+
						'</span>'+
						'<div class="progressHolder">'+
							'<div class="progress"></div>'+
						'</div>'+
					'</div></li>'; 
	
	
	function createImage(file){

		if(jQuery('.uploaded').length < 10)
		{

			var preview = jQuery(template), 
				image = jQuery('.dad_nahled', preview);
				
			var reader = new FileReader();
			
			image.width = 100;
			image.height = 100;
			
			reader.onload = function(e){
				
				// e.target.result holds the DataURL which
				// can be used as a source of the image:
				
				image.attr('src',e.target.result);
			};
			
			// Reading the file as a DataURL. When finished,
			// this will trigger the onload function above:
			reader.readAsDataURL(file);
			
			message.hide();
			preview.appendTo(list1);
			
			
			if(jQuery('.preview').size() > 50)
			{
				jQuery('.preview').css('width','50px');
				jQuery('.preview').css('height','50px');
				jQuery('.preview').find('img').css('max-width','50px');
				jQuery('.preview').find('img').css('max-height','30px');
			}
			else if(jQuery('.preview').size() > 15)
			{
				jQuery('.preview').css('width','100px');
				jQuery('.preview').css('height','100px');
				jQuery('.preview').find('img').css('max-width','100px');
				jQuery('.preview').find('img').css('max-height','70px');
			}
			
			// Associating a preview container
			// with the file, using jQuery's jQuery.data():
			
			jQuery.data(file,preview);

			jQuery('.dad_status:last').fadeIn().delay(500).fadeOut();
		}		
		else
		{
			alert('Maximální počet nahraných obrázků je 10.');
		}
		
	}

	function showMessage(msg){
		message.html(msg);
	}

});