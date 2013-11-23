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

    if(is_null($wpdb->get_var("SELECT COUNT(1) FROM $wpdb->terms WHERE user_id!=''")))
        $wpdb->query("ALTER TABLE $wpdb->terms ADD user_id INT NOT NULL DEFAULT 0");

    if(is_null($wpdb->get_var("SELECT COUNT(1) FROM $wpdb->terms WHERE datetime!=''")))
        $wpdb->query("ALTER TABLE $wpdb->terms ADD datetime INT NOT NULL DEFAULT 0");

    if($wpdb->get_var("SELECT COUNT(1) FROM $wpdb->options WHERE option_name='provize'") == 0)
        $wpdb->insert($wpdb->options, 
            array( 
                'option_name' => 'provize', 
                'option_value' => 0 , 
                'autoload' => 'no' 
            )
        );

    if($wpdb->get_var("SELECT COUNT(1) FROM $wpdb->options WHERE option_name='den_vyuctovani'") == 0)
        $wpdb->insert($wpdb->options, 
            array( 
                'option_name' => 'den_vyuctovani', 
                'option_value' => '1' , 
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
    {//echo $wpdb->get_var("SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name='bk_provize' AND TABLE_SCHEMA = '".DB_NAME."'");
        $sql =   "CREATE TABLE bk_provize (provize_id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(provize_id),
                  user_id INT NOT NULL,
                  provize_datum INT NOT NULL,
                  provize_vyse FLOAT,
                  provize_ip VARCHAR(20),
                  poznamka VARCHAR(250))";

        require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
        dbDelta($sql);
    }

    if(is_null($wpdb->get_var("SELECT COUNT(1) FROM bk_parametry")))
    {//echo $wpdb->get_var("SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name='bk_provize' AND TABLE_SCHEMA = '".DB_NAME."'");
        $sql =   "CREATE TABLE bk_parametry (parametr_id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(parametr_id),
                  parametr_nazev VARCHAR(250),
                  neaktivni_v VARCHAR(250),
                  parametr_ip VARCHAR(20),
                  parametr_time VARCHAR(20),
                  parametr_poznamka VARCHAR(50))";

        require_once( ABSPATH . 'wp-admin/includes/upgrade.php' );
        dbDelta($sql);
    }

    if(is_null($wpdb->get_var("SELECT COUNT(1) FROM bk_hodnoty")))
    {//echo $wpdb->get_var("SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name='bk_provize' AND TABLE_SCHEMA = '".DB_NAME."'");
        $sql =   "CREATE TABLE bk_hodnoty (hodnota_id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(hodnota_id),
                  parametr_id INT,
                  hodnota_nazev VARCHAR(250),
                  parametr_img VARCHAR(100),
                  parametr_ip VARCHAR(20),
                  parametr_time VARCHAR(20))";

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
    </div>

    <!--  styl pro tabulku kategorií woocmmerce  -->
    <style>
        #col-right {
            width: 100% !important;
        }
    </style>';

    echo $pole;
}
add_filter("product_cat_add_form_fields", "pridat_pole_kategorie");

function pridat_sloupec_kategorie( $columns ) {
    $new_columns = array();

    $new_columns['cb'] = $columns['cb'];
    unset( $columns['cb'] );
    foreach ($columns as $key => $value)
        $new_columns[$key] = $value;

    $new_columns['vytvoreno'] = __( 'Vytvořeno', 'woocommerce' );
    $new_columns['vytvoril'] = __( 'Vytvořil', 'woocommerce' );
    $new_columns['active'] = __( 'Aktivní', 'woocommerce' );

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
    if ( $column == 'vytvoril' ) {

        $user_id = $wpdb->get_var("SELECT user_id FROM $wpdb->terms WHERE term_id='$id'");
        if($user_id != 0)
            $text = get_userdata($user_id)->display_name;
        else
            $text = "---";

        $columns .= $text;

    }
    if ( $column == 'vytvoreno' ) {

        $time = $wpdb->get_var("SELECT datetime FROM $wpdb->terms WHERE term_id='$id'");
        if($time != 0)
            $text = date('<b>j.n.Y</b> G:i', $time);
        else
            $text = "---";

        $columns .= $text;

    }

    return $columns;
}

add_filter( 'manage_product_cat_custom_column', 'pridat_udaj_kategorie', 10, 3 );


function ulozit_udaj_kategorie( $term_id, $tt_id, $taxonomy ) {
    global $wpdb;

    if ( strlen($_POST['zobr']) > 0 ){
    
        $wpdb->query("UPDATE $wpdb->terms SET active='".($_POST['zobr'])."' WHERE term_id='$term_id'");
        $wpdb->query("UPDATE $wpdb->terms SET user_id='".get_current_user_id()."' WHERE term_id='$term_id' AND user_id='0'");
        $wpdb->query("UPDATE $wpdb->terms SET datetime='".time()."' WHERE term_id='$term_id' AND datetime='0'");
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

class Sady_List_Table extends WP_List_Table {

    /**
     * Constructor, we override the parent to pass our own arguments
     * We usually focus on three parameters: singular and plural labels, as well as whether the class supports AJAX.
     */
     function __construct() {
         parent::__construct( array(
        'singular'=> 'wp_sady_text_link', //Singular label
        'plural' => 'wp_sady_test_links', //plural label, also this well be one of the table css class
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
            'col_sada_id'=>'ID',
            'col_sada_jmeno'=>'Název sady (upravit)',
            'col_sada_vyse'=>'Hodnoty',
            'col_sada_datum'=>'Datum vyrvoření',
            'col_sada_poznamka'=>'Poznámka',
            'col_sada_smazat'=>'Smazat'
        );
    }

    public function get_sortable_columns() {
        return $sortable = array(
            'col_sada_id'=>array('parametr_id',true),
            //'col_parametry_jmeno'=>array('user_id',true),
            'col_sada_datum'=>array('parametr_time',true),
            'col_sada_jmeno'=>array('parametr_nazev',true)
        );
    }

    function column_booktitle($item) {
      $actions = array(
                'delete'    => sprintf('<a href="?page=%s&action=%s&sada=%s">Delete</a>',$_REQUEST['page'],'delete',$item['ID']),
            );

      return sprintf('%1$s %2$s', $item['ID'], $this->row_actions($actions) );
    }

    function get_bulk_actions() {
      $actions = array(
        'delete'    => 'Smazat'
      );
      return $actions;
    }

    function column_cb($item) {
        return sprintf(
            '<input type="checkbox" name="sada[]" value="%s" />', $item['ID']
        );    
    }

    function prepare_items() {
        global $wpdb, $_wp_column_headers;
        $screen = get_current_screen();

        /* -- Preparing your query -- */
            $query = "SELECT * FROM bk_parametry";

        /* -- Ordering parameters -- */
            //Parameters that are going to be used to order the result
            $orderby = !empty($_GET["orderby"]) ? mysql_real_escape_string($_GET["orderby"]) : 'ASC';
            $order = !empty($_GET["order"]) ? mysql_real_escape_string($_GET["order"]) : '';
            if(!empty($orderby) & !empty($order)){ $query.=' ORDER BY '.$orderby.' '.$order; }
            else $query.=' ORDER BY parametr_id DESC';

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
            echo '<tr id="record_'.$rec->parametr_id.'">';
            foreach ( $columns as $column_name => $column_display_name ) {

                //Style attributes for each col
                $class = "class='$column_name column-$column_name'";
                $style = "";
                //if ( in_array( $column_name, $hidden ) ) $style = ' style="display:none;"';
                //$attributes = $class . $style;

                //edit link
                $editlink  = '/wp-admin/link.php?action=edit&link_id='.(int)$rec->parametr_id;

                //Display the cell
                switch ( $column_name ) {
                    //case "cb": echo '<td '.$attributes.'>'.$column_display_name.'</td>';  break;
                    case "col_sada_id": echo '<td '.$attributes.'>'.stripslashes($rec->parametr_id).'</td>';  break;
                    case "col_sada_jmeno": echo '<td '.$attributes.'><a href="?page=sady&action=edit&sid='.$rec->parametr_id.'"><b>'.$rec->parametr_nazev.'</b></a></td>'; break;
                    case "col_sada_hodnoty": echo '<td '.$attributes.'>'.' %</td>'; break;
                    case "col_sada_poznamka": echo '<td '.$attributes.'><i>'.stripslashes($rec->parametr_poznamka).'</i></td>'; break;
                    case "col_sada_datum": echo '<td '.$attributes.'>'.date('j.n.Y G:i',stripslashes($rec->parametr_time)).'</td>'; break;
                    case "col_sada_smazat": echo '<td '.$attributes.'><a class="del" href="?page=sady&delete='.$rec->parametr_id.'"><img src="/wp-content/plugins/budkutil/img/delete.png" alt="delete" /></a></td>'; break;
                    
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

add_action( 'show_user_profile', 'budkutil_show_extra_profile_fields' );
add_action( 'edit_user_profile', 'budkutil_show_extra_profile_fields' );

function budkutil_show_extra_profile_fields( $user ) { 
    global $wpdb;

    ?>

    <h3>BuddyPress - profilové informace</h3>

    <table class="form-table">

    <?
    $groups = $wpdb->get_results("SELECT * FROM wp_bp_xprofile_groups");

    foreach ($groups as $group) {

        $extra_fields = $wpdb->get_results("SELECT * FROM wp_bp_xprofile_fields WHERE parent_id='0' AND group_id='".$group->id."'");

        echo "<tr><td colspan=\"2\"><br /><b>$group->name</b></td><tr>";

        foreach ($extra_fields as $field) {
            $extra_field_id = $field->id;
            $input = "";

            switch ($field->type) {
                case 'selectbox':
                    $input = '<select name="bp_meta_'.$extra_field_id.'" id="bp_meta_'.$extra_field_id.'">';
                    $input .= '<option value="none"></option>';
                    $options = $wpdb->get_results("SELECT * FROM wp_bp_xprofile_fields WHERE parent_id='".$field->id."' AND type='option'");
                        foreach ($options as $option)
                        {
                            $selected = '';
                            if(esc_attr( get_the_author_meta( 'bp_meta_'.$extra_field_id, $user->ID ) ) == $option->option_order)
                                $selected = 'selected="selected"';

                            $input .= '<option value="'.$option->option_order.'" '.$selected.'>'.$option->name.'</option>';
                        } 
                    $input .= '</select><br />';
                    $input .= '<p class="description">'.$field->description.'</p>';
                    break;

                case 'checkbox':
                    $options = $wpdb->get_results("SELECT * FROM wp_bp_xprofile_fields WHERE parent_id='".$field->id."' AND type='option'");
                        foreach ($options as $option)
                        {
                            $selected = '';
                            if(esc_attr( get_the_author_meta( 'bp_meta_'.$option->id, $user->ID ) ) == $option->option_order)
                                $selected = 'checked="checked"';

                            $input .= '<input type="checkbox" name="bp_meta_'.$option->id.'" id="bp_meta_'.$option->id.'" value="'.$option->option_order.'" '.$selected.' /> <i>'.$option->name.'</i><br />';//$extra_field_id
                        } 
                    $input .= '<p class="description">'.$field->description.'</p>';
                    break;

                case 'textarea':
                    $input = '<textarea cols="20" rows="5" name="bp_meta_'.$extra_field_id.'" id="bp_meta_'.$extra_field_id.'">'.esc_attr( get_the_author_meta( 'bp_meta_'.$extra_field_id, $user->ID ) ).'</textarea><br />';
                    $input .= '<p class="description">'.$field->description.'</p>';
                    break;

                case 'multiselectbox':
                    $input = '<select name="bp_meta_'.$extra_field_id.'[]" multiple="multiple" id="bp_meta_'.$extra_field_id.'">';
                    $options = $wpdb->get_results("SELECT * FROM wp_bp_xprofile_fields WHERE parent_id='".$field->id."' AND type='option'");
                    $data = explode(';', get_the_author_meta( 'bp_meta_'.$extra_field_id, $user->ID ));

                        foreach ($options as $option)
                        {
                            $selected = '';
                            if(in_array($option->option_order, $data))
                                $selected = 'selected="selected"';

                            $input .= '<option value="'.$option->option_order.'" '.$selected.'>'.$option->name.'</option>';
                        } 
                    $input .= '</select><br />';
                    $input .= '<p class="description">'.$field->description.'</p>';
                    break;

                case 'radio':
                    $options = $wpdb->get_results("SELECT * FROM wp_bp_xprofile_fields WHERE parent_id='".$field->id."' AND type='option'");
                        foreach ($options as $option)
                        {
                            $selected = '';
                            if(esc_attr( get_the_author_meta( 'bp_meta_'.$extra_field_id, $user->ID ) ) == $option->option_order)
                                $selected = 'checked="checked"';

                            $input .= '<input type="radio" name="bp_meta_'.$extra_field_id.'" id="bp_meta_'.$extra_field_id.'" value="'.$option->option_order.'" '.$selected.' /> <i>'.$option->name.'</i><br />';
                        } 
                    $input .= '<p class="description">'.$field->description.'</p>';
                    break;

                case 'datebox':
                    
                    $datum = get_the_author_meta( 'bp_meta_'.$extra_field_id, $user->ID );

                    $option_dny = '<option value="">---</option>';
                    for ($i=0; $i <= 31; $i++) { 
                        $selected = '';
                        if(date('j',$datum) == $i)
                            $selected = 'selected="selected"';

                        $option_dny .= '<option value="'.$i.'" '.$selected.'>'.$i.'</option>';
                    }

                    $option_roky = '<option value="">-------</option>';
                    for ($i=1930; $i <= date(Y)-10; $i++) { 
                        $selected = '';
                        if(date('Y',$datum) == $i)
                            $selected = 'selected="selected"';

                        $option_roky .= '<option value="'.$i.'" '.$selected.'>'.$i.'</option>';
                    }

                    $option_mesice = '<option value="">-------</option>';
                    $mesice = array("January","February","March","April","May","June","July","August","September","October","November","December");
                    foreach ($mesice as $mesic) {
                        $selected = '';
                        if(date('F',$datum) == $mesic)
                            $selected = 'selected="selected"';

                        $option_mesice .= '<option value="'.$mesic.'" '.$selected.'>'.$mesic.'</option>';
                    }

                    $input = '<select name="'.$extra_field_id.'_day">'.$option_dny.'</select>. <select name="'.$extra_field_id.'_month">'.$option_mesice.'</select> <select name="'.$extra_field_id.'_year">'.$option_roky.'</select>';
                    $input .= '<p class="description">'.$field->description.'</p>';
                    break;    
                
                default:
                    $input = '<input type="text" name="bp_meta_'.$extra_field_id.'" id="bp_meta_'.$extra_field_id.'" value="'.esc_attr( get_the_author_meta( 'bp_meta_'.$extra_field_id, $user->ID ) ).'" class="regular-text" /><br />';
                    $input .= '<p class="description">'.$field->description.'</p>';
                    break;
            }
                
            echo '<tr>
                <th><label for="bp_meta_'.$extra_field_id.'">'.$field->name.'</label></th>

                <td>
                    '.$input.'
                    <span class="description"></span>
                </td>
            </tr>';

        }
    }
    ?>
    </table>

    <br /><br /><br />
<?php }

add_action( 'personal_options_update', 'my_save_extra_profile_fields' );
add_action( 'edit_user_profile_update', 'my_save_extra_profile_fields' );

function my_save_extra_profile_fields( $user_id ) {
    global $wpdb;

    if ( !current_user_can( 'edit_user', $user_id ) )
        return false;
echo "<pre>";
    $extra_fields = $wpdb->get_results("SELECT * FROM wp_bp_xprofile_fields");

    foreach ($extra_fields as $field) {
        $extra_field_id = $field->id;
        $post_field = $_POST['bp_meta_'.$extra_field_id];

        if($field->type == "datebox")
        {
            $post_field = strtotime($_POST[$extra_field_id.'_day'].". ".$_POST[$extra_field_id.'_month']." ".$_POST[$extra_field_id.'_year']);
        }

        if(is_array($post_field))
            $post_field = implode(';', $post_field);

        //foreach ($post_field as $value) 
        update_usermeta( $user_id, 'bp_meta_'.$extra_field_id, $post_field);
    }
}

add_action('admin_menu', 'manchu_myposts');
function manchu_myposts()
{
    if (function_exists('add_submenu_page'))
    {
        //$parent, $page_title, $menu_title, $access_level, $file, $function = ''
        add_submenu_page('edit.php?post_type=product','Sady parametrů','Sady parametrů', 1, 'sady','sady_page');
    }
}

function cb_posts_for_current_author($query) {
     global $pagenow;

     if( 'edit.php?post_type=product' != $pagenow || !$query->is_admin )
     return $query;

     if( !current_user_can( 'manage_options' ) ) {
     global $user_ID;
     $query->set('author', $user_ID );
     }
     return $query;
}
add_filter('pre_get_posts', 'cb_posts_for_current_author');

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












/* ROZHRANí */


function sady_page() {
    global $wpdb;

    echo '<div class="wrap">';

    if($_POST['ulozit_sada'])
    {
        $error = 0;
        if(!$wpdb->insert('bk_parametry', 
            array( 
                'parametr_nazev' => $_POST['nazev'], 
                'neaktivni_v' => $_POST['poradi2'], 
                'parametr_time' => time(),
                'parametr_ip' => getRealIpAddr(),
                'parametr_poznamka' => $_POST['poznamka']
            )
        )) ++$error;
        
        if($error == 0)
            echo '<div class="updated"><p><strong>Nová sada parametrů úspěšně uložena.</strong></p></div>';
        else
            echo '<div class="error"><p><strong>Novou sadu parametrů se nepodařilo uložit.</strong></p></div>';

    }

    if($_GET['action'] == "add_sada")
    {
        //plugin_dir_path( __FILE__ )
                echo '
                <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> 
                <script src="/wp-content/plugins/budkutil/js/jquery-ui/js/jquery-ui-1.8.19.custom.min.js"></script>  
                <link rel="stylesheet" href="/wp-content/plugins/budkutil/js/jquery-ui/css/blitzer/jquery-ui-1.8.19.custom.css" type="text/css" media="screen" />';

                echo '
                <style>
                    #sortable1, #sortable2, #sortable3 { border: 1px solid rgb(188,188,188);list-style-type: none !important; margin: 0; padding: 0; float: left; margin-right: 10px; background: #eee; width: 280px !important; }
                    #sortable1 li, #sortable2 li, #sortable3 li {  border-top: 1px solid #ccc; list-style-type: none !important; padding: 5px; font-size: 1.2em; width: 253px !important; border: 0px !important}
                    #sortable2 {background: rgb(188,188,188) !important;padding: 10px;overflow: auto;height: 280px;}
                    #sortable2 li {color: red;}
                    #sortable1 {overflow: auto;height: 300px;}
                </style>
                <script>
                    jQuery(function() {
                        jQuery( "ul.droptrue" ).sortable({
                            connectWith: "ul",
                      update: function(event, ui) {
                        var data = "";

                        jQuery("#sortable1 li").each(function(i, el){
                            var p = jQuery(el).attr("title");
                            data += p+"="+jQuery(el).index()+",";
                        });

                        jQuery("#poradi").val(data);
                        }
                        });

                        jQuery( "ul.dropfalse" ).sortable({
                            connectWith: "ul",
                      update: function(event, ui) {
                        var data = "";

                        jQuery("#sortable2 li").each(function(i, el){
                            var p = jQuery(el).attr("title");
                            data += p+"="+jQuery(el).index()+",";
                        });

                        jQuery("#poradi2").val(data);
                        }
                        });

                        jQuery( "#sortable1, #sortable2" ).disableSelection();
                    });
                </script>
                ';

            echo '
 
                <h2>Nová sada parametrů</h2>
                <form method="post">
                    <table class="form-table">
                        <tbody>
                            <tr>
                                <th valign="top" scope="row">Název:</th>
                                <td>
                                    <input type="text" name="nazev" />
                                </td>
                            </tr>
                            <tr class="form-field form-required">
                                <th valign="top" scope="row">Kategorie:</th>
                                <td>
                                    <div style="width: 290px;float: left">
                                        <b>Zobrazováno v kategoriích:</b>              
                                    </div>
                                    <div>
                                        <b>Nezobrazováno v kategoriích:</b>
                                    </div>
                                    <input type="hidden" id="poradi" name="poradi" />
                                    <input type="hidden" id="poradi2" name="poradi2" />
                                    <ul id="sortable1" class="droptrue">';
                                    
                                        $kategorie = $wpdb->get_results("SELECT * FROM $wpdb->terms ORDER BY name");
                                        foreach ($kategorie as $zaznam) 
                                            echo '<li class="ui-state-default" title="'.$zaznam->term_id.'">'.$zaznam->name.'</li>';
                                    
                                    echo '
                                    </ul>
                                     
                                    <ul id="sortable2" class="dropfalse">
                                    </ul>
                                </td>
                            </tr>
                            <tr>
                                <th valign="top" scope="row"></th>
                                <td>
                                    <input type="submit" class="button button-primary" name="ulozit_sada" value="Uložit" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>';

               
    }
    else
    {
        echo '
        <h2>
            Sady parametrů
            <a class="add-new-h2" href="admin.php?page='.$_REQUEST['page'].'&action=add_sada">Nová sada parametrů</a>
        </h2>';

        $wp_list_table = new Sady_List_Table();
        $wp_list_table->prepare_items();
        //$wp_list_table->search_box('vyhledat podle ID', 'provize_id');
        $wp_list_table->display();
    }

    echo '</div>';
}



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
        
                add_submenu_page('bk_page', 'Nastavení', 'Nastavení', 
                              'administrator', 'nastaveni', 
                              array(&$this, 'nastaveni_page'));
        
                remove_submenu_page('bk_page', 'bk_page');

            }
        }

        
 
        function menu_page() {    
            
        }
 
        public function provize_page() {
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
                if($wpdb->update($wpdb->options, array('option_value'=>$_POST['vyse_glob_provize']), array('option_name'=>'provize')) === false)
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
                            'provize_ip' => getRealIpAddr(),
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
                            'provize_ip' => getRealIpAddr(),
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
 
        function nastaveni_page() {
            global $wpdb;

            if($_POST['ulozit_nastaveni'])
            {
                $cislo = $wpdb->update($wpdb->options, array('option_value'=>$_POST['ucet_provize']), array('option_name'=>'ucet_provize'));
                $den   = $wpdb->update($wpdb->options, array('option_value'=>$_POST['den_vyuctovani']), array('option_name'=>'den_vyuctovani'));

                if($cislo === false AND $den === false)
                    echo '<div class="error"><p><strong>Nastavení se nepodailo uložit.</strong></p></div>';
                else
                    echo '<div class="updated"><p><strong>Nastavení bylo úspěšně uloženo.</strong></p></div>';
            }

            echo '<div class="wrap">';
            echo '<div class="icon32" id="icon-options-general"><br></div>';
            echo '<h2>Nastavení</h2>';

             $ucet_provize   = $wpdb->get_var("SELECT option_value FROM $wpdb->options WHERE option_name='ucet_provize'");
             $den_vyuctovani = $wpdb->get_var("SELECT option_value FROM $wpdb->options WHERE option_name='den_vyuctovani'");

            echo '
            <form method="post">
                <table class="form-table">
                    <tr>
                        <th valign="top" scope="row">
                            Bankovní účet:
                        </th>
                        <td>
                            <input type="text" name="ucet_provize" value="'.$ucet_provize.'" /><br />
                            <span class="description">Bankovní účet pro příjem provizí od uživatelů. <a href="?page=provize">Přejít na nastavení provizí ></a></span>
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" scope="row">
                            Den vyúčtování provizí:
                        </th>
                        <td>
                            <input type="text" size="1" name="den_vyuctovani" value="'.$den_vyuctovani.'" />. den měsíce<br />
                            <span class="description">n-tý den měsíce, ve kterém budou vyúčtovány provize a rozeslány notifikace.
                        </td>
                    </tr>
                    <tr>
                        <th valign="top" scope="row"></th>
                        <td>
                            <input type="submit" class="button button-primary" name="ulozit_nastaveni" value="Uložit nastavení" />
                        </td>
                    </tr>
                </table>
            </form>';

            echo '</div>';
        }

    }
}
 
$wpdpd = new budkutil_admin_menu();

?>
