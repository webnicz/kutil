<? 
$umisteni = explode( 'wp-content', $_SERVER['SCRIPT_FILENAME'] );
require_once( $umisteni[0] . 'wp-load.php' );

if(is_user_logged_in())
{
	$produkt = $_GET['get_pid'];
	$pole = $_GET['get_pole'];
	$sady = $_GET['get_aktivni'];
	$index = 0;
	parse_str($pole, $pole_parsed);

	foreach ($pole_parsed as $parametr) {
		$sada = $sady[$index];

		if($wpdb->get_var("SELECT * FROM bk_produkty_sady WHERE produkt_id='".$produkt."' AND sada_id='".$sada."'"))
		{
			$wpdb->update('bk_produkty_sady', 
	            array( 
	                'parametr_id' => $parametr, 
	                'time' => time()
	            ),
                array( 
                	'produkt_id' => $produkt, 
                	'sada_id' => $sada, 
                )
	        );
		}
		else
		{
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
}
?>