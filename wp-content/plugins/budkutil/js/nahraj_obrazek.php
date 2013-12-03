<?php
$demo_mode = true;
$upload_dir = '';
$allowed_ext = array('jpg','jpeg','png','gif');


if(strtolower($_SERVER['REQUEST_METHOD']) != 'post'){
	exit_status('Error! Špatná metoda HTTP!');
}


if(array_key_exists('pic',$_FILES) && $_FILES['pic']['error'] == 0 ){
	
	$pic = $_FILES['pic'];

	if(!in_array(get_extension($pic['name']),$allowed_ext)){
		exit_status('Pouze '.implode(',',$allowed_ext).' soubory jsou povoleny!');
	}	

	if($demo_mode){
		
		// File uploads are ignored. We only log them.
		
		$line = implode('		', array( date('r'), $_SERVER['REMOTE_ADDR'], $pic['size'], $pic['name']));
		file_put_contents('log.txt', $line.PHP_EOL, FILE_APPEND);
		
		exit_status('Uploads are ignored in demo mode.');
	}
	
	
	// Move the uploaded file from the temporary 
	// directory to the uploads folder:
	
	$cesta = $pic['name'];
	$datum = time();
	if(move_uploaded_file($pic['tmp_name'], $cesta)){
		exit_status('File was uploaded successfuly!');
		
		//$q = "INSERT INTO galerie (id,session,id_video,cesta,datum,popis)
		//	 VALUES ('','".$_SESSION['session']."','','".str_replace("../","",$cesta)."','$datum','')";
		//$conn->exec($q);
	}
	
}

exit_status('Something went wrong with your upload!');

// Helper functions

function exit_status($str){
	echo json_encode(array('status'=>$str));
	exit;
}

function get_extension($file_name){
	$ext = explode('.', $file_name);
	$ext = array_pop($ext);
	return strtolower($ext);
}
?>