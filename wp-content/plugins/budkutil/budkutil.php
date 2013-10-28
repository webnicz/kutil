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


function check_db() {
    global $wpdb;

    if(is_null($wpdb->get_var("SELECT COUNT(1) FROM $wpdb->terms WHERE active!=''")))
        $wpdb->query("ALTER TABLE $wpdb->terms ADD active INT NOT NULL DEFAULT 1");

    if($wpdb->get_var("SELECT COUNT(1) FROM $wpdb->options WHERE option_name='provize'") == 0)
        $wpdb->insert($wpdb->options, 
            array( 
                'option_name' => 'provize', 
                'option_value' => 0 , 
                'autoload' => 'no' 
            )
        );

    if($wpdb->get_var("SELECT COUNT(1) FROM $wpdb->options WHERE option_name='ucet_provize'") == 0)
        $wpdb->insert($wpdb->options, 
            array( 
                'option_name' => 'ucet_provize', 
                'option_value' => 0 , 
                'autoload' => 'no' 
            )
        );

    if(is_null($wpdb->get_var("SELECT COUNT(1) FROM bk_provize")))
    {
        $sql =   "CREATE TABLE bk_provize (provize_id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(provize_id),
                  user_id INT NOT NULL,
                  provize_datum INT NOT NULL,
                  provize_vyse FLOAT,
                  provize_ip VARCHAR(20),
                  poznamka VARCHAR(250))";

        require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
        dbDelta($sql);
    }
}
check_db();

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
        'singular'=> 'wp_provize_text_link', //Singular label
        'plural' => 'wp_provize_test_links', //plural label, also this well be one of the table css class
        'ajax'  => false //We won't support Ajax for this table
        ) );
     }

     function extra_tablenav( $which ) {
        if ( $which == "top" ){
            //The code that goes before the table is here
            echo"";//Hello, I'm before the table
        }
        if ( $which == "bottom" ){
            //The code that goes after the table is there
            echo"";//Hi, I'm after the table
        }
    }

    function get_columns() {
        return $columns= array(
            //'cb' => '<input type="checkbox" name="book[]" value="%s" />',
            'col_provize_id'=>'ID',
            'col_provize_jmeno'=>'Uživatel (upravit)',
            'col_provize_vyse'=>'Výše',
            'col_provize_poznamka'=>'Poznámka',
            'col_provize_datum'=>'Datum',
            'col_provize_smazat'=>'Smazat'
        );
    }

    public function get_sortable_columns() {
        return $sortable = array(
            'col_provize_id'=>array('provize_id',true),
            //'col_provize_jmeno'=>array('user_id',true),
            'col_provize_datum'=>array('provize_datum',true),
            'col_provize_vyse'=>array('provize_vyse',true)
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
            else $query.=' ORDER BY provize_id DESC';

        /* -- Pagination parameters -- */
            //Number of elements in your table?
            $totalitems = $wpdb->query($query); //return the total number of affected rows
            //How many to display per page?
            $perpage = 20;
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
        //list( $columns, $hidden ) =  //get_sortable_columns
        $this->get_column_info();

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

                $uziv = get_userdata($rec->user_id);
                //Display the cell
                switch ( $column_name ) {
                    //case "cb": echo '<td '.$attributes.'>'.$column_display_name.'</td>';  break;
                    case "col_provize_id": echo '<td '.$attributes.'>'.stripslashes($rec->provize_id).'</td>';  break;
                    case "col_provize_jmeno": echo '<td '.$attributes.'><a href="?page=provize&action=edit_individualni&pid='.$rec->provize_id.'"><b>'.$uziv->display_name.'</b></a></td>'; break;
                    case "col_provize_vyse": echo '<td '.$attributes.'>'.stripslashes($rec->provize_vyse).' %</td>'; break;
                    case "col_provize_poznamka": echo '<td '.$attributes.'><i>'.stripslashes($rec->poznamka).'</i></td>'; break;
                    case "col_provize_datum": echo '<td '.$attributes.'>'.date('j.n.Y G:i',stripslashes($rec->provize_datum)).'</td>'; break;
                    case "col_provize_smazat": echo '<td '.$attributes.'><a class="del" href="?page=provize&delete='.$rec->provize_id.'"><img src="/wp-content/plugins/budkutil/img/delete.png" alt="delete" /></a></td>'; break;
                    
                }
            }

            //Close the line
            echo'</tr>';
        }}
    }
}

function test_modify_user_table( $column ) {
    $column['provize'] = 'Provize';
 
    return $column;
}
 
add_filter( 'manage_users_columns', 'test_modify_user_table' );
 
function test_modify_user_table_row( $val, $column_name, $user_id ) {
    global $wpdb;

    $provize = $wpdb->get_var("SELECT provize_vyse FROM bk_provize WHERE user_id='$user_id'");

    if(empty($provize))
        $provize = "<i>Plošná</i>";
    else
        $provize .= " %";

    switch ($column_name) {
        case 'provize' :
            return $provize;
            break;
 
        default:
    }
 
    return $return;
}
 
add_filter( 'manage_users_custom_column', 'test_modify_user_table_row', 10, 3 );



















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
        
                //add_submenu_page('bk_page', 'Uživatelé', 'Správa uživatelů', 
                //              'administrator', 'uzivatele', 
                //              array(&$this, 'uzivatele_page'));
        
                remove_submenu_page('bk_page', 'bk_page');

            }
        }

        function getRealIpAddr()
        {
            if (!empty($_SERVER['HTTP_CLIENT_IP']))   //check ip from share internet
            {
              $ip=$_SERVER['HTTP_CLIENT_IP'];
            }
            elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR']))   //to check ip is pass from proxy
            {
              $ip=$_SERVER['HTTP_X_FORWARDED_FOR'];
            }
            else
            {
              $ip=$_SERVER['REMOTE_ADDR'];
            }
            return $ip;
        }
 
        function menu_page() {    
            
        }
 
        function provize_page() {
            global $wpdb;    
            $PAGE = "provize";

            echo '<link href="/wp-content/plugins/budkutil/css/style.css" rel="stylesheet"/>';
            echo '<div class="wrap">';


            if($_GET['delete'])
            {
                    if($wpdb->delete('bk_provize', array( 'provize_id' => $_GET['delete'])))
                        echo '<div class="updated"><p><strong>Záznam byl smazán.</strong></p></div>';
                    else
                        echo '<div class="error"><p><strong>Záznam se nepodařilo smazat.</strong></p></div>';
            }

            if($_POST['ulozit_glob_provize'])
            {
                if($wpdb->update($wpdb->options, array('option_value'=>$_POST['vyse_glob_provize']), array('option_name'=>'provize')) === false AND $wpdb->update($wpdb->options, array('option_value'=>$_POST['ucet_provize']), array('option_name'=>'ucet_provize')) === false)
                    echo '<div class="error"><p><strong>Výši provize se nepodařilo uložit.</strong></p></div>';
                else
                    echo '<div class="updated"><p><strong>Výše provize uložena.</strong></p></div>';
            }

            if($_POST['ulozit_indi_provize'])
            {
                $error = 0;
                $uzivatele = explode(',', $_POST['uzivatel']);

                foreach ($uzivatele as $key => $value) {

                    if(!$wpdb->insert('bk_provize', 
                        array( 
                            'user_id' => $value,
                            'provize_datum' => time(), 
                            'provize_vyse' => $_POST['provize'], 
                            'provize_ip' => $this->getRealIpAddr(),
                            'poznamka' => $_POST['poznamka']
                        )
                    ))
                      ++$error;
                }

                if($error == 0)
                    echo '<div class="updated"><p><strong>Výše individuální provize uložena.</strong></p></div>';
                else
                    echo '<div class="error"><p><strong>Výši individuální provize se nepodařilo uložit.</strong></p></div>';

            }

            if($_POST['upravit_indi_provize'])
            {
                    if($wpdb->update('bk_provize', 
                        array( 
                            'provize_datum' => time(), 
                            'provize_vyse' => $_POST['provize'], 
                            'provize_ip' => $this->getRealIpAddr(),
                            'poznamka' => $_POST['poznamka']
                        ),
                        array( 'provize_id' => $_GET['pid'])
                    ))
                        echo '<div class="updated"><p><strong>Úpravy byly úspěšně uloženy.</strong></p></div>';
                    else
                        echo '<div class="error"><p><strong>Úpravy se nepodařilo uložit.</strong></p></div>';
            }

            

            if($_GET['action'] == "add_individualni")
            {
                //plugin_dir_path( __FILE__ )
                echo '
                <link href="/wp-content/plugins/budkutil/js/select/select2.css" rel="stylesheet"/>
    <script src="/wp-content/plugins/budkutil/js/select/select2.js"></script>
                <h2>Nová individuální provize</h2>
                <form method="post">
                    <table class="form-table">
                        <tbody>
                            <tr class="form-field form-required">
                                <th valign="top" scope="row">Uživatelé:</th>
                                <td>
                                    <input id="vyber" type="text" name="uzivatel" style="width: 300px !important" />
                                </td>
                            </tr>
                            <tr>
                                <th valign="top" scope="row">Provize:</th>
                                <td>
                                    <input type="text" name="provize" size="3" /> %
                                </td>
                            </tr>
                            <tr class="form-field form-required">
                                <th valign="top" scope="row">Poznámka:</th>
                                <td>
                                    <textarea name="poznamka" cols="20" rows="5"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th valign="top" scope="row"></th>
                                <td>
                                    <input type="submit" class="button button-primary" name="ulozit_indi_provize" value="Uložit" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>';

                echo '<script>
                jQuery("#vyber").select2({
                    placeholder: "Pište uživatelovo jméno, ID nebo e-mail",
                    minimumInputLength: 1,
                     multiple: true,
                    ajax: { 
                        url: "/wp-content/plugins/budkutil/js/uzivatele.php",
                         dataType: "json",
                         width: "element",
                        data: function (term, page) {
                            return {
                                q: term
                            };
                        },
                        results: function (data, page) {
                            return { results: data };
                        }
                    }
                });
                </script>
                ';
            }
            elseif($_GET['action'] == "edit_individualni")
            {
                //plugin_dir_path( __FILE__ )
                $provize = $wpdb->get_row("SELECT * FROM bk_provize WHERE provize_id='".$_GET['pid']."'");
                $uziv = get_userdata($provize->user_id);

                echo '
                <link href="/wp-content/plugins/budkutil/js/select/select2.css" rel="stylesheet"/>
    <script src="/wp-content/plugins/budkutil/js/select/select2.js"></script>
                <h2>Upravení individuální provize</h2>
                <form method="post">
                    <table class="form-table">
                        <tbody>
                            <tr>
                                <th valign="top" scope="row">Uživatel:</th>
                                <td>
                                    <b>'.$uziv->display_name.'</b>
                                    <input type="hidden" name="uzivatel_id" value="'.$provize->user_id.'" />
                                </td>
                            </tr>
                            <tr>
                                <th valign="top" scope="row">Provize:</th>
                                <td>
                                    <input type="text" name="provize" size="3" value="'.$provize->provize_vyse.'" /> %
                                </td>
                            </tr>
                            <tr class="form-field form-required">
                                <th valign="top" scope="row">Poznámka:</th>
                                <td>
                                    <textarea name="poznamka" cols="20" rows="5">'.$provize->poznamka.'</textarea>
                                </td>
                            </tr>
                            <tr>
                                <th valign="top" scope="row"></th>
                                <td>
                                    <input type="submit" class="button button-primary" name="upravit_indi_provize" value="Uložit změny" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>';

                echo '<script>
                jQuery("#vyber").select2({
                    placeholder: "Pište uživatelovo jméno, ID nebo e-mail",
                    minimumInputLength: 1,
                     multiple: true,
                    ajax: { 
                        url: "/wp-content/plugins/budkutil/js/uzivatele.php",
                         dataType: "json",
                         width: "element",
                        data: function (term, page) {
                            return {
                                q: term
                            };
                        },
                        results: function (data, page) {
                            return { results: data };
                        }
                    }
                });
                </script>
                ';
            }
            else
            {
                echo '
                <h2>
                    Plošná výše provize
                </h2>';

                $glob_provize = $wpdb->get_var("SELECT option_value FROM $wpdb->options WHERE option_name='provize'");
                $ucet_provize = $wpdb->get_var("SELECT option_value FROM $wpdb->options WHERE option_name='ucet_provize'");

                echo '
                <form method="post" class="postbox">
                    <div class="inside">
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
                                <td>
                                    Bankovní účet:
                                </td>
                                <td>
                                    <input type="text" name="ucet_provize" value="'.$ucet_provize.'" /> %
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


                echo '
                <h2>
                    Individuálních výše provizí
                    <a class="add-new-h2" href="?page='.$PAGE.'&action=add_individualni">Nová individuální provize</a>
                </h2>';

                $wp_list_table = new Provize_List_Table();
                $wp_list_table->prepare_items();
                //$wp_list_table->search_box('vyhledat podle ID', 'provize_id');
                $wp_list_table->display();
            }

            echo '<script>
            jQuery(document).ready(function(){
                jQuery(".del").click(function () {
                    if (confirm("Smazat záznam o individuální provizi")) {
                        return true;
                    }
                    return false;
                });
            });
            </script>';
            echo '</div>';
        }
 
        function uzivatele_page() {
        
        }

    }
}
 
$wpdpd = new budkutil_admin_menu();

?>
