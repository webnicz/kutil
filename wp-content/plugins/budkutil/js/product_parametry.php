<? 
$umisteni = explode( 'wp-content', $_SERVER['SCRIPT_FILENAME'] );
require_once( $umisteni[0] . 'wp-load.php' );
//require_once( $umisteni[0] . 'wp-config.php' );
//require_once( $umisteni[0] . 'wp-settings.php' );

if(is_user_logged_in())
{
	$sada_id = $_GET['get_sada'];
	$aktivni = $_GET['get_aktivni'];

	if(!empty($sada_id))
	{
		echo "<div>";

		if(!in_array($sada_id, $aktivni)) {
		
			include ABSPATH."wp-content/plugins/budkutil/js/nastaveni_parametru_vypis.php";
		}
		else
		{
			echo '<i class="sady_empty">Tato sada je již aktivní</i>';
		}

		echo "</div>";
	}
}
?>