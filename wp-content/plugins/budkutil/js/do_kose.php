<?
$umisteni = explode( 'wp-content', $_SERVER['SCRIPT_FILENAME'] );
require_once( $umisteni[0] . 'wp-load.php' );

if($_GET['klic'] == "f9dks" AND is_user_logged_in())
{ 
    $file = './tmp_img/'.$_GET['time']."_".$_GET['img'];
    
    if(file_exists($file))
    {
        if(unlink($file))
            echo "OK";
    }
} 
else 
{
	$time 	= $_POST['time'];
	$dir 	= ABSPATH.'wp-content/plugins/budkutil/js/tmp_img/';
	$mine 	= array("image/jpeg","image/pjpeg","image/png","image/gif");
	if(!empty($time))
	{
		if (is_dir($dir)) {
		    if ($dh = opendir($dir)) {
		        while (($file = readdir($dh)) !== false) {
		            if(preg_match('/^'.$time.'/i', $file))
		            {
		                if(in_array(mime_content_type($dir . $file),$mine))
		                {    
		                   unlink($dir . $file);
		                }
		            }
		        }
		        closedir($dh);
		    }
		}
	}
}   
?>