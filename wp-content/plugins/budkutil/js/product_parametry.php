<? 
$umisteni = explode( 'wp-content', $_SERVER['SCRIPT_FILENAME'] );
require_once( $umisteni[0] . 'wp-load.php' );

if(is_user_logged_in())
{
	$sada_id = $_GET['get_sada'];

	if(!empty($sada_id))
	{
		function set_cookie_pamet_sada($sada_id) {
			setcookie('sada'.$sada_id, array(), time()+60, COOKIEPATH, COOKIE_DOMAIN, false);
		}
		add_action( 'init', 'set_cookie_pamet_sada');

		if(!is_array($_COOKIE['sada'.$sada_id])) set_cookie_pamet_sada($sada_id);
		if(!in_array($sada_id, $_COOKIE['sada'.$sada_id])) {
			
			array_push($_COOKIE['sada'.$sada_id], $sada_id);

		
			$parametry = $wpdb->get_results("SELECT * FROM bk_hodnoty WHERE parametr_id='".$sada_id."'");
			foreach ($parametry as $parametr) {
				$parametry_options .= '<option>'.$parametr->hodnota_nazev.'</option>';
			}

			$sada = $wpdb->get_row("SELECT * FROM bk_parametry WHERE parametr_id='".$sada_id."'");
			echo '<div>'.$sada->parametr_nazev.'</div>';

			if(!empty($parametry_options))
			{
				echo '<div>
					<select>
						<option> Vyberte hodnotu </option>
						'.$parametry_options.'
					</select>
				</div>';
			}
			else{
				echo '<i>Tato sada nemá žádné parametry</i>';
			}
		}
	}
}
?>