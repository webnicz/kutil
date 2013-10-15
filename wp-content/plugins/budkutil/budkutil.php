<?php
/**
 * @package Budkutil
 * @version 0.1
 */
/*
Plugin Name: Budkutil
Plugin URI: http://webartmedia.cz/
Description: Rozšíření a integrace funkcí wordpressu, buddypressu a e-commerce řešení
Author: Pavel Drbálek
Version: 0.1
Author URI: http://webartmedia.cz

*/


function pridat_pole_kategorie($taxonomy) {
  $pole = '
  	<div class="form-field">
		<label for="tag-zobr_field">Zobrazovat:</label>
		<input type="checkbox" id="zobr_field" name="zobr" value="true" checked="checked" />
		<p>Tato položka povoluje zobrazovat se kategorii ve front-endu</p>
	</div>';

	echo $pole;
}
add_filter("product_cat_add_form_fields", "pridat_pole_kategorie");


if (!class_exists("budkutil_admin_menu")) {
 
    class budkutil_admin_menu {
 
        function budkutil_admin_menu() {
            add_action('admin_menu', array(&$this, 'add_menu_page'));
        }
 
 
        function add_menu_page() {
            if (function_exists('add_menu_page')) {
 
                add_menu_page('Budkutil', 'Budkutil', 
				              'administrator', 'bk_page', 
							  array(&$this, 'menu_page'), 
							  './images/calendar.png',1);//date-button.gif
 		
                add_submenu_page('bk_page', 'Uživatelé', 'Správa uživatelů', 
				              'administrator', 'uzivatele', 
							  array(&$this, 'uzivatele_page'));
		
				remove_submenu_page('bk_page', 'bk_page');

            }
        }
 
        function menu_page() {    
			
        }
 
        function uzivatele_page() {
		
        }

	}
}
 
$wpdpd = new budkutil_admin_menu();

?>
