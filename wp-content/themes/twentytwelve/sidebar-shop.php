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
				
				<div class="innerFilter">
					<label for="">Cena</label>	
					<input type="text" name="min" value="" class="form-control" /> - <input type="text" name="max" value="" class="form-control" />
				</div>
				
				<div class="innerFilter">
					<label>Barva</label>
					<ul>
						<li class="sada1">
	            		<img alt="testovaci obrazek" src="/wp-content/plugins/budkutil/up_img/1390582262_cervena.png">
	            		<label><input type="checkbox" value="1" name="sada[]" class="parametr_input">Červená</label>
	            	</li><li class="sada1">
	            		<img alt="testovaci obrazek" src="/wp-content/plugins/budkutil/up_img/1390582271_zelena.png">
	            		<label><input type="checkbox" value="2" name="sada[]" class="parametr_input">Zelená</label>
	            	</li><li class="sada1">
	            		<img alt="testovaci obrazek" src="/wp-content/plugins/budkutil/up_img/1390582278_modra.png">
	            		<label><input type="checkbox" value="3" name="sada[]" class="parametr_input">Modrá</label>
	            	</li><li class="sada1">
	            		<img alt="testovaci obrazek" src="/wp-content/plugins/budkutil/up_img/1390582286_zluta.png">
	            		<label><input type="checkbox" value="4" name="sada[]" class="parametr_input">Žlutá</label>
	            	</li><li class="sada1">
	            		<img alt="testovaci obrazek" src="/wp-content/plugins/budkutil/up_img/1390582294_cerna.png">
	            		<label><input type="checkbox" value="5" name="sada[]" class="parametr_input">Černá</label>
	            	</li><li class="sada1">
	            		<img alt="testovaci obrazek" src="/wp-content/plugins/budkutil/up_img/1390582301_bílá.png">
	            		<label><input type="checkbox" value="6" name="sada[]" class="parametr_input">Bílá</label>
	            	</li>
					</ul>
				</div>
				
				<div class="innerFilter">
					<label>Materiál výrobku</label>
					<ul>
						<li class="sada4">
	            		<img alt="testovaci obrazek" src="/wp-content/plugins/budkutil/up_img/1392283429_drevo.jpg">
	            		<label><input type="checkbox" value="7" name="sada[]" class="parametr_input">Dřevo</label>
	            	</li><li class="sada4">
	            		<img alt="testovaci obrazek" src="/wp-content/plugins/budkutil/up_img/1392283489_latka.jpg">
	            		<label><input type="checkbox" value="8" name="sada[]" class="parametr_input">Látka</label>
	            	</li><li class="sada4">
	            		<img alt="testovaci obrazek" src="/wp-content/plugins/budkutil/up_img/1392283530_kuze.jpg">
	            		<label><input type="checkbox" value="9" name="sada[]" class="parametr_input">Kůže</label>
	            	</li>
					</ul>
				</div>
				
			</aside>
			
		</div><!-- #secondary -->
	<?php endif; ?>
	