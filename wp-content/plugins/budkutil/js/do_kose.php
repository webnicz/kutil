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
?>