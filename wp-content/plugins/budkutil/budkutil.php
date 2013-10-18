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
$exists = $wpdb->get_var("SELECT COUNT(1) FROM $wpdb->terms WHERE active!=''");

if(is_null($exists))
{
    $wpdb->query("ALTER TABLE $wpdb->terms ADD active INT NOT NULL DEFAULT 1");
}

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

function pridat_sloupec_kategorie( $columns ) {
    $new_columns = array();
    $new_columns['cb'] = $columns['cb'];
    $new_columns['active'] = __( 'Aktivní', 'woocommerce' );

    unset( $columns['cb'] );

    return array_merge( $new_columns, $columns );
}

add_filter( 'manage_edit-product_cat_columns', 'pridat_sloupec_kategorie' );

function pridat_udaj_kategorie( $columns, $column, $id ) {
    global $woocommerce;
    global $wpdb;

    if ( $column == 'active' ) {

        if($wpdb->get_var("SELECT active FROM $wpdb->terms WHERE term_id='$id'") == 1)
            $text = "Aktivní";
        else
            $text = "Neaktivní";

        $columns .= $text;

    }

    return $columns;
}

add_filter( 'manage_product_cat_custom_column', 'pridat_udaj_kategorie', 10, 3 );


function ulozit_udaj_kategorie( $term_id, $tt_id, $taxonomy ) {
    global $wpdb;

    if ( isset( $_POST['zobr'] ) ){
    
        $wpdb->query("UPDATE $wpdb->terms SET active='".(($_POST['zobr'] == 1) ? 0 : 1)."' WHERE term_id='$term_id'");
    }
}

add_action( 'created_term', 'ulozit_udaj_kategorie', 10,3 );
add_action( 'edit_term', 'ulozit_udaj_kategorie', 10,3 );




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
