<?
$umisteni = explode( 'wp-content', $_SERVER['SCRIPT_FILENAME'] );
require_once( $umisteni[0] . 'wp-load.php' );

if(is_user_logged_in())
{
	$q = sanitize_text_field($_GET['q']);

	$sql = "SELECT * FROM $wpdb->users WHERE user_email REGEXP '".$q."' OR ID REGEXP '".$q."' OR user_nicename REGEXP '".$q."' OR user_login REGEXP '".$q."' OR user_email REGEXP '".$q."' OR display_name REGEXP '".$q."'";
	$uzivatele = $wpdb->get_results($sql);

	$answer = array();
	foreach ($uzivatele as $uzivatel)
		array_push($answer, array("id"=>$uzivatel->ID,"text"=>$uzivatel->display_name));

	echo json_encode($answer);
}
?>