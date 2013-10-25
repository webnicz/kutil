<?
require_once('../../../../../wp-load.php');
$sql = "SELECT * FROM $wpdb->users WHERE user_email REGEXP '".$_GET['q']."' OR ID REGEXP '".$_GET['q']."' OR user_nicename REGEXP '".$_GET['q']."' OR user_login REGEXP '".$_GET['q']."' OR user_email REGEXP '".$_GET['q']."' OR display_name REGEXP '".$_GET['q']."'";
$uzivatele = $wpdb->get_results($sql);

$answer = array();
foreach ($uzivatele as $uzivatel) {
	array_push($answer, array("id"=>$uzivatel->ID,"text"=>$uzivatel->display_name));
}

echo json_encode($answer);
?>