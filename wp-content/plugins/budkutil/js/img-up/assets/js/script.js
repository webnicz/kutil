jQuery(function(){
	
	var dropbox = jQuery('#dropbox'),
		message = jQuery('.message', dropbox);
	
	dropbox.filedrop({
		// The name of the jQuery_FILES entry:
		paramname:'pic',
		
		maxfiles: 100,
    	maxfilesize: 2,
		url: '/wp-content/plugins/budkutil/js/nahraj_obrazek.php',
		
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
					showMessage('Tato verze prohlížeče ještě nepodporuje nahrávání souborů pomocí HTML5!');
					break;
				case 'TooManyFiles':
					alert('Vybráno příliš mnoho souborů. Maximálně lze vybrat 100 souborů najednou.');
					break;
				case 'FileTooLarge':
					alert(file.name+'  příliš velký! Maximální povolená velikost souboru jsou 2MB.');
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
	
	var template = '<div class="preview">'+
						'<span class="imageHolder">'+
							'<img />'+
							'<span class="uploaded"></span>'+
						'</span>'+
						'<div class="progressHolder">'+
							'<div class="progress"></div>'+
						'</div>'+
					'</div>'; 
	
	
	function createImage(file){

		var preview = jQuery(template), 
			image = jQuery('img', preview);
			
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
		preview.appendTo(dropbox);
		
		
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
	}

	function showMessage(msg){
		message.html(msg);
	}

});