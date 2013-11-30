<? 
$umisteni = explode( 'wp-content', $_SERVER['SCRIPT_FILENAME'] );
require_once( $umisteni[0] . 'wp-load.php' );

if(is_user_logged_in())
{
	$produkt = $_GET['get_pid'];
	$sada = $_GET['get_sada'];

	$wpdb->delete('bk_produkty_sady', 
                array( 
                	'produkt_id' => $produkt, 
                	'sada_id' => $sada, 
                ));
}
?>