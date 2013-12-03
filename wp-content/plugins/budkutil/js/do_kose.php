<?
$umisteni = explode( 'wp-content', $_SERVER['SCRIPT_FILENAME'] );
require_once( $umisteni[0] . 'wp-load.php' );

if($_GET['klic'] == "f9dks" AND is_user_logged_in())
{ 
    if(isset($_GET['idecko']))
    {
        $id = $_GET['idecko'];
        $q = "DELETE FROM _wp_attachment_metadata WHERE id='$id'";
        //$conn->exec($q);
    }
    else
    {
        /*$adresar = "../galerie/";
        $obr = $_GET['img'];
        $cesta = $adresar.$obr;
        
        $q = "DELETE FROM galerie WHERE cesta='$obr' AND session='".$_SESSION['session']."' ORDER BY id DESC LIMIT 1";
        //echo $q;
        $conn->exec($q);
        
        $q = "SELECT * FROM galerie WHERE session='".$_SESSION['session']."'";
    	$docasnych = $conn->query($q);
    	$pocet = $docasnych->rowCount();
        
        if($pocet == 0)
            unlink($cesta);/*
    }
}    
?>