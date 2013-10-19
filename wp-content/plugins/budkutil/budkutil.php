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

$exists = $wpdb->get_var("SELECT COUNT(1) FROM $wpdb->options WHERE option_name='provize'");

if($exists == 0)
{
    $wpdb->query("INSERT INTO $wpdb->options VALUES('','provize','0','no')");
}

$exists = $wpdb->get_var("SELECT COUNT(1) FROM bk_provize");

if(is_null($exists))
{
    $wpdb->query("CREATE TABLE bk_provize (provize_id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(provize_id),
                      user_id INT NOT NULL,
                      provize_datum INT NOT NULL,
                      provize_vyse FLOAT,
                      provize_ip VARCHAR(20))");
}

if(!class_exists('WP_List_Table')){
    require_once( ABSPATH . 'wp-admin/includes/class-wp-list-table.php' );
}


function pridat_pole_kategorie($taxonomy) {
  $pole = '
    <div class="form-field">
        <label for="tag-zobr_field">Zobrazovat:</label>
        <input type="checkbox" id="zobr_field" name="zobr" value="1" checked="checked" />
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

    if ( strlen($_POST['zobr']) > 0 ){
    
        $wpdb->query("UPDATE $wpdb->terms SET active='".($_POST['zobr'])."' WHERE term_id='$term_id'");
    }
}

add_action( 'created_term', 'ulozit_udaj_kategorie', 10,3 );
add_action( 'edit_term', 'ulozit_udaj_kategorie', 10,3 );


function editace_kategorie( $term, $taxonomy ) {
    global $woocommerce;
    global $wpdb;

    if($wpdb->get_var("SELECT active FROM $wpdb->terms WHERE term_id='$term->term_id'") == 1)
            $selected = "selected=\"selected\"";
    ?>
    <tr class="form-field">
        <th scope="row" valign="top"><label>Zobrazovat:</label></th>
        <td>
            <select name="zobr" class="postform">
                <option value="0">NE</option>
                <option value="1" <? echo $selected;?>>ANO</option>
            </select>
        </td>
    </tr>
    <?php
}

add_action( 'product_cat_edit_form_fields', 'editace_kategorie', 10,2 );

class Provize_List_Table extends WP_List_Table {

    /**
     * Constructor, we override the parent to pass our own arguments
     * We usually focus on three parameters: singular and plural labels, as well as whether the class supports AJAX.
     */
     function __construct() {
         parent::__construct( array(
        'singular'=> 'wp_provuze_text_link', //Singular label
        'plural' => 'wp_provuze_test_links', //plural label, also this well be one of the table css class
        'ajax'  => false //We won't support Ajax for this table
        ) );
     }

     function extra_tablenav( $which ) {
        if ( $which == "top" ){
            //The code that goes before the table is here
            echo"Hello, I'm before the table";
        }
        if ( $which == "bottom" ){
            //The code that goes after the table is there
            echo"Hi, I'm after the table";
        }
    }

    function get_columns() {
        return $columns= array(
            'cb' => '<input type="checkbox" name="book[]" value="%s" />',
            'col_provize_id'=>'ID',
            'col_provize_jmeno'=>'Uživatel',
            'col_provize_vyse'=>'Výše',
            'col_provize_poznamka'=>'Poznámka',
            'col_provize_datum'=>'Datum'
        );
    }

    public function get_sortable_columns() {
        return $sortable = array(
            'col_provize_id'=>'provize_id',
            'col_provize_jmeno'=>'user_id',
            'col_provize_datum'=>'provize_datum'
        );
    }

    function column_booktitle($item) {
      $actions = array(
                'delete'    => sprintf('<a href="?page=%s&action=%s&book=%s">Delete</a>',$_REQUEST['page'],'delete',$item['ID']),
            );

      return sprintf('%1$s %2$s', $item['booktitle'], $this->row_actions($actions) );
    }

    function get_bulk_actions() {
      $actions = array(
        'delete'    => 'Smazat'
      );
      return $actions;
    }

    function column_cb($item) {
        return sprintf(
            '<input type="checkbox" name="book[]" value="%s" />', $item['ID']
        );    
    }

    function prepare_items() {
        global $wpdb, $_wp_column_headers;
        $screen = get_current_screen();

        /* -- Preparing your query -- */
            $query = "SELECT * FROM bk_provize";

        /* -- Ordering parameters -- */
            //Parameters that are going to be used to order the result
            $orderby = !empty($_GET["orderby"]) ? mysql_real_escape_string($_GET["orderby"]) : 'ASC';
            $order = !empty($_GET["order"]) ? mysql_real_escape_string($_GET["order"]) : '';
            if(!empty($orderby) & !empty($order)){ $query.=' ORDER BY '.$orderby.' '.$order; }

        /* -- Pagination parameters -- */
            //Number of elements in your table?
            $totalitems = $wpdb->query($query); //return the total number of affected rows
            //How many to display per page?
            $perpage = 5;
            //Which page is this?
            $paged = !empty($_GET["paged"]) ? mysql_real_escape_string($_GET["paged"]) : '';
            //Page Number
            if(empty($paged) || !is_numeric($paged) || $paged<=0 ){ $paged=1; }
            //How many pages do we have in total?
            $totalpages = ceil($totalitems/$perpage);
            //adjust the query to take pagination into account
            if(!empty($paged) && !empty($perpage)){
                $offset=($paged-1)*$perpage;
                $query.=' LIMIT '.(int)$offset.','.(int)$perpage;
            }

        /* -- Register the pagination -- */
            $this->set_pagination_args( array(
                "total_items" => $totalitems,
                "total_pages" => $totalpages,
                "per_page" => $perpage,
            ) );
            //The pagination links are automatically built according to those parameters

        /* -- Register the Columns -- */
            $columns = $this->get_columns();
            //$_wp_column_headers[$screen->id]=$columns;
            $hidden = array();
            $sortable = $this->get_sortable_columns();
            $this->_column_headers = array($columns, $hidden, $sortable);

        /* -- Fetch the items -- */
            $this->items = $wpdb->get_results($query);
    }

    function display_rows() {

        //Get the records registered in the prepare_items method
        $records = $this->items;
        $columns = $this->get_columns();

        //Get the columns registered in the get_columns and get_sortable_columns methods
        //list( $columns, $hidden ) = $this->get_column_info(); //get_sortable_columns

        //Loop for each record
        if(!empty($records)){foreach($records as $rec){

            //Open the line
            echo '<tr id="record_'.$rec->provize_id.'">';
            foreach ( $columns as $column_name => $column_display_name ) {

                //Style attributes for each col
                $class = "class='$column_name column-$column_name'";
                $style = "";
                //if ( in_array( $column_name, $hidden ) ) $style = ' style="display:none;"';
                //$attributes = $class . $style;

                //edit link
                $editlink  = '/wp-admin/link.php?action=edit&link_id='.(int)$rec->provize_id;

                //Display the cell
                switch ( $column_name ) {
                    case "cb": echo '<td '.$attributes.'>'.$column_display_name.'</td>';  break;
                    case "col_provize_id": echo '<td '.$attributes.'>'.stripslashes($rec->provize_id).'</td>';  break;
                    case "col_provize_jmeno": echo '<td '.$attributes.'>'.stripslashes($rec->user_id).'</td>'; break;
                    case "col_provize_vyse": echo '<td '.$attributes.'>'.stripslashes($rec->provize_datum).'</td>'; break;
                    case "col_provize_poznamka": echo '<td '.$attributes.'>'.'</td>'; break;
                    case "col_provize_datum": echo '<td '.$attributes.'>'.'</td>'; break;
                }
            }

            //Close the line
            echo'</tr>';
        }}
    }
}









/* ROZHRANí */

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

                add_submenu_page('bk_page', 'Provize', 'Správa provizí', 
                              'administrator', 'provize', 
                              array(&$this, 'provize_page'));
        
                add_submenu_page('bk_page', 'Uživatelé', 'Správa uživatelů', 
                              'administrator', 'uzivatele', 
                              array(&$this, 'uzivatele_page'));
        
                remove_submenu_page('bk_page', 'bk_page');

            }
        }
 
        function menu_page() {    
            
        }
 
        function provize_page() {
        global $wpdb;    

            if($_POST['ulozit_glob_provize'])
            {
                if($wpdb->query("UPDATE $wpdb->options SET option_value='".$_POST['vyse_glob_provize']."' WHERE option_name='provize'"))
                    echo '<div class="updated"><p><strong>Výše provize uložena.</strong></p></div>';
                else
                    echo '<div class="error"><p><strong>Výši provize se nepodařilo uložit.</strong></p></div>';
            }

            echo '<div class="wrap">';
            echo '
            <h2>
                Správa provizí 
                <a class="add-new-h2" href="post-new.php">Nová individuální provize</a>
            </h2>';

            $glob_provize = $wpdb->get_var("SELECT option_value FROM $wpdb->options WHERE option_name='provize'");
            echo '
            <form method="post" class="postbox">
                <div class="inside">
                    <h3>
                        Plošná výše provize:
                    </h3>
                    <table>
                        <tr>
                            <td>
                                Výše provize:
                            </td>
                            <td>
                                <input type="text" size="5" name="vyse_glob_provize" value="'.$glob_provize.'" /> %
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <input type="submit" class="button button-primary" name="ulozit_glob_provize" value="Uložit" />
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
            ';

            echo '<br /><br /><h3>Individuálních výše provizí:</h3>';

            $wp_list_table = new Provize_List_Table();
            $wp_list_table->prepare_items();
            $wp_list_table->search_box('search', 'provize_id');
            $wp_list_table->display();
        }
 
        function uzivatele_page() {
        
        }

    }
}
 
$wpdpd = new budkutil_admin_menu();

?>
