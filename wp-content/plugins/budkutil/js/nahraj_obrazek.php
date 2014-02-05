<?php
//error_reporting(E_ALL);
//ini_set('display_errors', 1);

$demo_mode = false;
$upload_dir = './tmp_img/';
$allowed_ext = array('jpg','jpeg','png','gif');

	if(strtolower($_SERVER['REQUEST_METHOD']) != 'post'){
		exit_status('Error! Špatná metoda HTTP!');
	}

	function exit_status($str, $type = "status"){
		echo json_encode(array($type=>$str));
		exit;
	}

	function get_extension($file_name){
		$ext = explode('.', $file_name);
		$ext = array_pop($ext);
		return strtolower($ext);
	}

if($_GET['n'] < 10)
{
	if(isset($_FILES['pic']))//array_key_exists('pic',$_FILES) //isset($_FILES['pic']['error'])
	{
		if($_FILES['pic']['error'] == 0)
		{
			$pic = $_FILES['pic'];

			if(!in_array(get_extension($pic['name']),$allowed_ext)){
				exit_status('Pouze '.implode(',',$allowed_ext).' soubory jsou povoleny!');
			}	

			if($demo_mode)
			{	
				$line = implode('		', array( date('r'), $_SERVER['REMOTE_ADDR'], $pic['size'], $pic['name']));
				file_put_contents('log.txt', $line.PHP_EOL, FILE_APPEND);
				
				exit_status('Uploads are ignored in demo mode.');
			}
			
			$cesta = $pic['name'];
			$datum = time();
			$konecna_cesta = $upload_dir.$_GET['time'].'_'.$cesta;
			//preg_replace('/(.+\/)([a-z]+\.[a-zA-Z]{2,4})$/i', '${1}'.time().'_${2}', subject)

			if(file_exists($upload_dir))
			{
				if(is_writable($upload_dir))
				{
					if(move_uploaded_file($pic['tmp_name'], $konecna_cesta))
					{

						if($_GET['way'] == "input")
							exit_status($konecna_cesta, 'url');
						else
							exit_status('File was uploaded successfuly!');
						
						//$q = "INSERT INTO galerie (id,session,id_video,cesta,datum,popis)
						//	 VALUES ('','".$_SESSION['session']."','','".str_replace("../","",$cesta)."','$datum','')";
						//$conn->exec($q);
					}
					exit_status('Write error');
				}
				exit_status('Denied');
			}
			exit_status('Bad destination');
		}
		exit_status('Upload data error #'.$_FILES['pic']['error']);
	}

	exit_status('No data');
	//exit_status('Something went wrong with your upload!');	
}
?>