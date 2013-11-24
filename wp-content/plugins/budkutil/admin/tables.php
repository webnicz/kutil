<?
if(!class_exists('WP_List_Table')){
    require_once( ABSPATH . 'wp-admin/includes/class-wp-list-table.php' );
}

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
            'col_sada_hodnoty'=>'Hodnoty',
            'col_sada_datum'=>'Datum vyrvoření',
            //'col_sada_poznamka'=>'Poznámka',
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
                    case "col_sada_jmeno": echo '<td '.$attributes.'><a href="admin.php?page=sady&action=edit&sid='.$rec->parametr_id.'"><b>'.$rec->parametr_nazev.'</b></a></td>'; break;
                    case "col_sada_hodnoty": echo '<td '.$attributes.'></td>'; break;
                    //case "col_sada_poznamka": echo '<td '.$attributes.'><i>'.stripslashes($rec->parametr_poznamka).'</i></td>'; break;
                    case "col_sada_datum": echo '<td '.$attributes.'>'.date('j.n.Y G:i',stripslashes($rec->parametr_time)).'</td>'; break;
                    case "col_sada_smazat": echo '<td '.$attributes.'><a class="del" href="?page=sady&delete='.$rec->parametr_id.'"><img src="/wp-content/plugins/budkutil/img/delete.png" alt="delete" /></a></td>'; break;
                    
                }
            }

            //Close the line
            echo'</tr>';
        }}
    }
}

class Hodnoty_List_Table extends WP_List_Table {

    /**
     * Constructor, we override the parent to pass our own arguments
     * We usually focus on three parameters: singular and plural labels, as well as whether the class supports AJAX.
     */
     function __construct() {
         parent::__construct( array(
        'singular'=> 'wp_hodnoty_text_link', //Singular label
        'plural' => 'wp_hodnoty_test_links', //plural label, also this well be one of the table css class
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
            'col_hodnoty_id'=>'ID',
            'col_hodnoty_nahld'=>'Náhled',
            'col_hodnoty_jmeno'=>'Název parametru (upravit)',
            'col_hodnoty_hodnoty'=>'Sada',
            'col_hodnoty_datum'=>'Datum vyrvoření',
            //'col_hodnoty_poznamka'=>'Poznámka',
            'col_hodnoty_smazat'=>'Smazat'
        );
    }

    public function get_sortable_columns() {
        return $sortable = array(
            'col_hodnoty_id'=>array('hodnota_id',true),
            //'col_hodnotay_jmeno'=>array('user_id',true),
            'col_hodnoty_datum'=>array('hodnota_time',true),
            'col_hodnoty_jmeno'=>array('hodnota_nazev',true)
        );
    }

    function column_booktitle($item) {
      $actions = array(
                'delete'    => sprintf('<a href="?page=%s&action=%s&parametr=%s">Delete</a>',$_REQUEST['page'],'delete',$item['ID']),
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
            '<input type="checkbox" name="parametr[]" value="%s" />', $item['ID']
        );    
    }

    function prepare_items() {
        global $wpdb, $_wp_column_headers;
        $screen = get_current_screen();

        /* -- Preparing your query -- */
            $query = "SELECT * FROM bk_hodnoty";

        /* -- Ordering parameters -- */
            //Parameters that are going to be used to order the result
            $orderby = !empty($_GET["orderby"]) ? mysql_real_escape_string($_GET["orderby"]) : 'ASC';
            $order = !empty($_GET["order"]) ? mysql_real_escape_string($_GET["order"]) : '';
            if(!empty($orderby) & !empty($order)){ $query.=' ORDER BY '.$orderby.' '.$order; }
            else $query.=' ORDER BY hodnota_id DESC';

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
            echo '<tr id="record_'.$rec->hodnota_id.'">';
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
                    case "col_sada_jmeno": echo '<td '.$attributes.'><a href="admin.php?page=sady&action=edit&sid='.$rec->parametr_id.'"><b>'.$rec->parametr_nazev.'</b></a></td>'; break;
                    case "col_sada_hodnoty": echo '<td '.$attributes.'></td>'; break;
                    //case "col_sada_poznamka": echo '<td '.$attributes.'><i>'.stripslashes($rec->parametr_poznamka).'</i></td>'; break;
                    case "col_sada_datum": echo '<td '.$attributes.'>'.date('j.n.Y G:i',stripslashes($rec->parametr_time)).'</td>'; break;
                    case "col_sada_smazat": echo '<td '.$attributes.'><a class="del" href="?page=sady&delete='.$rec->parametr_id.'"><img src="/wp-content/plugins/budkutil/img/delete.png" alt="delete" /></a></td>'; break;
                    
                }
            }

            //Close the line
            echo'</tr>';
        }}
    }
}
?>