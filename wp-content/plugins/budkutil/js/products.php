<?
$umisteni = explode( 'wp-content', $_SERVER['SCRIPT_FILENAME'] );
require_once( $umisteni[0] . 'wp-load.php' );

$atributy = $_GET['sada'];
$kategorie = $_GET['kat'];
$page = (empty($_GET['str'])) ? 1 : $_GET['str'];
$min = filter_var($_GET['min'], FILTER_SANITIZE_NUMBER_INT);
$max = filter_var($_GET['max'], FILTER_SANITIZE_NUMBER_INT);

if(sizeof($atributy) > 0)
{
	foreach ($atributy as $atribut) {

	    $atribut = explode('_', $atribut);
	    $conditions[] = "bk_produkty_sady.sada_id='{$atribut[0]}' AND bk_produkty_sady.parametr_id='{$atribut[1]}'";
	}

	$others = " AND (".implode(' OR ', $conditions).")";
}	

$charakterizovano = $wpdb->get_results("SELECT * FROM bk_produkty_sady, wp_term_relationships WHERE bk_produkty_sady.produkt_id=wp_term_relationships.object_id AND wp_term_relationships.term_taxonomy_id='{$kategorie}'".$others." GROUP BY produkt_id");

foreach ($charakterizovano as $polozka) {

	$cena_regular = $wpdb->get_var("SELECT meta_value FROM wp_postmeta WHERE meta_key='_regular_price' AND post_id='{$polozka->produkt_id}'");
	$cena = $wpdb->get_var("SELECT meta_value FROM wp_postmeta WHERE meta_key='_price' AND post_id='{$polozka->produkt_id}'");


	if((empty($min) OR $cena_regular>=$min) AND (empty($max) OR $cena_regular<=$max))
		if((empty($min) OR $cena>=$min) AND (empty($max) OR $cena<=$max))
    		$produkty[] = $polozka->produkt_id;
}





$args = array(
    'post_type' => 'product',
    'post__in' => $produkty,
    'paged' => $page,
);
$wp_query = new WP_Query($args);

do_action('woocommerce_archive_description'); 

do_action('woocommerce_result_count');

echo '<ul class = "products-list">';
     while (have_posts()) : the_post();

         woocommerce_get_template_part('content', 'product'); 

     endwhile;
echo '</ul>';

echo '<div id="doAjax">';
do_action('woocommerce_after_shop_loop');
echo '</div>';
?>

<script type="text/javascript">
jQuery('#doAjax a').click( function(e) {
	e.preventDefault();

	//var href = jQuery(this).attr('href');
	//var params = href.substring(href.indexOf('?')*1+1);
	jQuery('.widget_product_filter input[name=str]').val(jQuery(this).text());
	jQuery('.widget_product_filter input').trigger('change');
});
</script>