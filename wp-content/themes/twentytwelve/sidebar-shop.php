<?php
/**
 * The sidebar containing the main widget area.
 *
 * If no active widgets in sidebar, let's hide it completely.
 *
 * @package WordPress
 * @subpackage Twenty_Twelve
 * @since Twenty Twelve 1.0
 */
?>

	<?php if ( is_active_sidebar( 'shop' ) ) : ?>
		<div id="secondary" class="widget-area" role="complementary">
			
			
			<?php dynamic_sidebar( 'shop' ); ?>
			
			<aside class="widget woocommerce widget_product_filter" id="product_categories-2">
				<h3 class="widget-title">Upřesnit výpis</h3>

				<form id="innerFilterForm">
				
					<div class="innerFilter">
						<label for="">Cena</label>	
						<span><input type="text" name="min" value="" class="form-control" /> - <input type="text" name="max" value="" class="form-control" /></span>
					</div>
					
					<?
					$query_kategorie = $wp_query->query[product_cat];
					$kategorie = $wpdb->get_row("SELECT * FROM $wpdb->terms WHERE slug='{$query_kategorie}'");

					$sady = $wpdb->get_results("SELECT * FROM bk_parametry WHERE neaktivni_v NOT REGEXP '{$kategorie->term_id}=' ORDER BY parametr_nazev ASC");

					foreach ($sady as $sada) {
						
						$hodnoty = array();
						$parametry = $wpdb->get_results("SELECT * FROM bk_hodnoty WHERE parametr_id='{$sada->parametr_id}' ORDER BY hodnota_nazev ASC");				    

						foreach ($parametry as $parametr) {

							$pocet = $wpdb->get_var("SELECT SUM(1) AS pocet FROM bk_produkty_sady, wp_term_relationships WHERE bk_produkty_sady.parametr_id='{$parametr->hodnota_id}' AND bk_produkty_sady.produkt_id=wp_term_relationships.object_id  AND wp_term_relationships.term_taxonomy_id='{$kategorie->term_id}'");//$wpdb->get_var("SELECT SUM(1) AS pocet FROM bk_produkty_sady WHERE parametr_id='{$parametr->hodnota_id}'");

							$hodnoty[] = array('nazev' => $parametr->hodnota_nazev, 'id' => $parametr->hodnota_id, 'img' => $parametr->hodnota_img, 'pocet' => $pocet);
						}

						$sady_parametru[] = array('parametr_id' => $sada->parametr_id, 'nazev' => $sada->parametr_nazev, 'hodnoty' => $hodnoty);
					}

					foreach ($sady_parametru as $sada) {
						
						if(sizeof($sada[hodnoty]) > 0)
						{
							echo '<div class="innerFilter">';
							echo '<label>'.$sada[nazev].'</label>';
							echo '<ul>';

								foreach ($sada[hodnoty] as $hodnota) {
									
									if($hodnota[pocet] > 0)
										$pocet = ' <span class="pocet_produktu_parametr">('.$hodnota[pocet].')</span>';
									else
										$pocet = "";
									
									echo '<li class="sada'.$sada[parametr_id].'">';
				            		if(file_exists(ABSPATH."wp-content/plugins/budkutil/up_img/".$hodnota[img])) 
				            			echo '<img alt="'.$hodnota[nazev].'" src="/wp-content/plugins/budkutil/up_img/'.$hodnota[img].'">';
				            		echo '<label><input type="checkbox" value="'.$sada[parametr_id].'_'.$hodnota[id].'" name="sada[]" class="parametr_input">'.$hodnota[nazev].$pocet.'</label>';
				            		echo '</li>';
								}

							echo '</ul></div>';
						}
					}

					echo '<input type="hidden" name="kat" value="'.$kategorie->term_id.'" />';
					echo '<input type="hidden" name="str" value="" />';
					?>

				</form>
				
			</aside>
			
		</div><!-- #secondary -->
	<?php endif; ?>
	