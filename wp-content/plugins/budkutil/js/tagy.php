<?
$umisteni = explode( 'wp-content', $_SERVER['SCRIPT_FILENAME'] );
require_once( $umisteni[0] . 'wp-load.php' );

if(is_user_logged_in())
{
	$q = sanitize_text_field($_GET['q']);

	$sql = "SELECT wp_terms.name AS nazev, SUM(1) AS pocet FROM wp_terms, wp_term_taxonomy WHERE wp_term_taxonomy.taxonomy='product_tag' AND wp_terms.name REGEXP '".$q."' GROUP BY wp_terms.name ORDER BY pocet";
	$tagy = $wpdb->get_results($sql);

	$answer = array();
	foreach ($tagy as $tag)
		array_push($answer, array("id"=>$tag->nazev,"text"=>$tag->nazev));

	if(sizeof($answer) == 0)
		array_push($answer, array("id"=>$q,"text"=>$q));		

	echo json_encode($answer);
}
?>