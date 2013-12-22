<? 
$umisteni = explode( 'wp-content', $_SERVER['SCRIPT_FILENAME'] );
require_once( $umisteni[0] . 'wp-load.php' );
//require_once( $umisteni[0] . 'wp-config.php' );
//require_once( $umisteni[0] . 'wp-settings.php' );

if(is_user_logged_in())
{
	$sada_id 	= $_GET['get_sada'];
	$aktivni 	= $_GET['get_aktivni'];
	$key 		= $_GET['key'];

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
	else
	{
		echo '<div class="attr_row">
            <select name="sada[]" class="attribute_taxonomy">
                <option value="">Vyberte parametr</option>';
                
                $sady = $wpdb->get_results("SELECT * FROM bk_parametry ORDER BY parametr_nazev");
                foreach ($sady as $sada)
                    echo '<option value="'.$sada->parametr_id.'">'.$sada->parametr_nazev.'</option>';
                
                echo '
            </select>
        </div>';
	}
}
?>