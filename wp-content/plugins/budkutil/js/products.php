<?
$umisteni = explode( 'wp-content', $_SERVER['SCRIPT_FILENAME'] );
require_once( $umisteni[0] . 'wp-load.php' );

$atributy = $_GET['sada'];
$kategorie = $_GET['kat'];
$min = filter_var($_GET['min'], FILTER_SANITIZE_NUMBER_INT);
$max = filter_var($_GET['max'], FILTER_SANITIZE_NUMBER_INT);

foreach ($atributy as $atribut) {

    $atribut = explode('_', $atribut);
    $conditions[] = "bk_produkty_sady.sada_id='{$atribut[0]}' AND bk_produkty_sady.parametr_id='{$atribut[1]}'";
}

$others = " AND (".implode(' OR ', $conditions).")";

$charakterizovano = $wpdb->get_results("SELECT * FROM bk_produkty_sady, wp_term_relationships, wp_postmeta WHERE bk_produkty_sady.produkt_id=wp_term_relationships.object_id AND bk_produkty_sady.produkt_id=wp_postmeta.post_id AND wp_term_relationships.term_taxonomy_id='{$kategorie}'".$others);

foreach ($charakterizovano as $polozka) {

	$cena = $wpdb->get_var("SELECT meta_value FROM wp_postmeta WHERE meta_key='_regular_price' AND post_id='{$polozka->produkt_id}'");

	if((empty($min) OR $cena>$min) AND (empty($max) OR $cena<$max))
    	$produkty[] = $polozka->produkt_id;
}

$paged = (get_query_var('paged')) ? get_query_var('paged') : 1;

$args = array(
    'post_type' => 'product',
    'post_in' => $produkty,
    'paged' => $paged,
);
$wp_query = new WP_Query($args);


do_action('woocommerce_archive_description'); 

echo '<ul class = "products-list">';
     while (have_posts()) : the_post();

         woocommerce_get_template_part('content', 'product'); 

     endwhile;
echo '</ul>';

do_action('woocommerce_after_shop_loop');
?>