<? 
$umisteni = explode( 'wp-content', $_SERVER['SCRIPT_FILENAME'] );
require_once( $umisteni[0] . 'wp-load.php' );

if(is_user_logged_in())
{
	$produkt = $_GET['get_pid'];
	//$pole = $_GET['get_pole'];
	$sady = $_GET['get_aktivni'];
	$index = 0;
	parse_str($sady, $sady_parsed);

	print_r($sady_parsed);

	$wpdb->delete( 'bk_produkty_sady', array( 'produkt_id' => $produkt ) );

	foreach ($sady_parsed[sada] as $parametr) {
		//$sada = $sady[$index];
		$sada = $wpdb->get_var("SELECT parametr_id FROM bk_hodnoty WHERE hodnota_id='".$parametr."'");

		$wpdb->insert('bk_produkty_sady', 
            array( 
                'produkt_id' => $produkt, 
                'sada_id' => $sada, 
                'parametr_id' => $parametr, 
                'time' => time()
            )
        );
	}
}
?>