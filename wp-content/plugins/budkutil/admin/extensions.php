<?
add_filter( 'post_thumbnail_html', 'remove_attributes', 10 );
add_filter( 'image_send_to_editor', 'remove_attributes', 10 );

function remove_attributes( $html ) {
   $html = preg_replace( '/(width|height)="\d*"\s/', "", $html );
   return $html;
}

function budkutil_edit_order_columns($columns){
    global $woocommerce;

    $columns = array();

    $columns["cb"]                  = "<input type=\"checkbox\" />";
    $columns["order_status"]        = __( 'Status', 'woocommerce' );
    $columns["order_title"]         = __( 'Order', 'woocommerce' );
    $columns["order_prodejce"]      = 'Prodejce';
    $columns["billing_address"]     = __( 'Billing', 'woocommerce' );
    $columns["shipping_address"]    = __( 'Shipping', 'woocommerce' );
    $columns["total_cost"]          = __( 'Order Total', 'woocommerce' );
    $columns["order_comments"]      = '<img alt="' . esc_attr__( 'Order Notes', 'woocommerce' ) . '" src="' . $woocommerce->plugin_url() . '/assets/images/order-notes_head.png" class="tips" data-tip="' . __( 'Order Notes', 'woocommerce' ) . '" width="12" height="12" />';
    $columns["note"]                = '<img src="' . $woocommerce->plugin_url() . '/assets/images/note_head.png" alt="' . __( 'Customer Notes', 'woocommerce' ) . '" class="tips" data-tip="' . __( 'Customer Notes', 'woocommerce' ) . '" width="12" height="12" />';
    $columns["order_date"]          = __( 'Date', 'woocommerce' );
    $columns["order_actions"]       = __( 'Actions', 'woocommerce' );

    return $columns;
}

add_filter('manage_edit-shop_order_columns', 'budkutil_edit_order_columns'); 

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

add_action( 'woocommerce_product_write_panel_tabs', 'budkutil_extra_panel' );

function budkutil_extra_panel() {
    ?>
    <li class="attributes_tab attribute_options"><a href="#budkutil_sady" title="">Sady parametrů</a></li>
    <?php
}

add_action( 'woocommerce_product_write_panels', 'budkutil_sady_panel' ); 

function budkutil_sady_panel($post) {
    global $wpdb;
    ?>
    <div id="budkutil_sady" class="panel wc-metaboxes-wrapper">

            <p class="toolbar">
                <div class="infobox_attr"></div>
            </p>

            <div class="woocommerce_attributes_sady wc-metaboxes">
                <?
                $sady = $wpdb->get_results("SELECT * FROM bk_produkty_sady WHERE produkt_id='".$_GET['post']."'");
                foreach ($sady as $sada) {
                    $sada_id = $sada->sada_id;
                    $parametr_id = $sada->parametr_id;

                    include ABSPATH."wp-content/plugins/budkutil/js/nastaveni_parametru_vypis.php";
                }
                ?>
            </div>

            <p class="toolbar">
                <button type="button" class="button button-primary add_attribute" id="add_sada">Přidat</button>
                <select name="sada" class="attribute_taxonomy">
                    <option value="">Vyberte sadu parametrů</option>
                    <?
                    $sady = $wpdb->get_results("SELECT * FROM bk_parametry ORDER BY parametr_nazev");
                    foreach ($sady as $sada) {
                        echo '<option value="'.$sada->parametr_id.'">'.$sada->parametr_nazev.'</option>';
                    }
                    ?>
                </select>

                <button type="button" class="button" id="save_sada">Uložit</button>
            </p>
        </div>
        <script>
        jQuery('#add_sada').click( function () {
            var vybrano = jQuery('select[name=sada] option:selected').html();
            var sada    = jQuery('select[name=sada]').val();
            var aktivni = new Array();

            var aktivni = new Array();
               for(i=0; i <= jQuery('.nazev_sady').length; i++)
                    if(jQuery('.nazev_sady:eq('+i+')').attr('id') != null)
                        aktivni.push(jQuery('.nazev_sady:eq('+i+')').attr('id'));                    

            jQuery.get('../wp-content/plugins/budkutil/js/product_parametry.php', { get_sada: sada, get_aktivni: aktivni }, function(data) { 
                jQuery('.woocommerce_attributes_sady').append(data);
                jQuery('.sady_empty').delay(1500).fadeOut();
                jQuery('select[name=sada] option:contains('+vybrano+')').remove();
            });
        });

        jQuery('#save_sada').click( function () {
            var aktivni = new Array();
            var pole    = jQuery('.woocommerce_attributes_sady select').serialize();
            jQuery('.infobox_attr').html("Ukládám...").show();

            var aktivni = new Array();
               for(i=0; i <= jQuery('.nazev_sady').length; i++)
                    if(jQuery('.nazev_sady:eq('+i+')').attr('id') != null)
                        aktivni.push(jQuery('.nazev_sady:eq('+i+')').attr('id'));                    

            jQuery.get('../wp-content/plugins/budkutil/js/product_parametry_save.php', { get_pid: <? echo $_GET['post'];?>, get_pole: pole, get_aktivni: aktivni }, function(data) { 
                jQuery('.infobox_attr').html("Uloženo");
                jQuery('.infobox_attr').delay(1000).fadeOut();
            });
        });

        function odebrat_sadu(sada_id) {
            jQuery.get('../wp-content/plugins/budkutil/js/product_parametry_delete.php', { get_pid: <? echo $_GET['post'];?>, get_sada: sada_id }, function(data) { 
                jQuery('.nazev_sady[id='+sada_id+']').parent().fadeOut();
            });
        }

        
        </script>
    <?
}



function extra_profile_fields_groups($groups, $user) {
    global $wpdb;

    $html = "";
    foreach ($groups as $group) {

        $extra_fields = $wpdb->get_results("SELECT * FROM wp_bp_xprofile_fields WHERE parent_id='0' AND group_id='".$group->id."'");

        $html .= "<tr><td colspan=\"2\"><br /><b>$group->name</b></td><tr>";

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
                    
                    $datum = strtotime(get_the_author_meta( 'bp_meta_'.$extra_field_id, $user->ID ));

                    $option_dny = '<option value="">---</option>';
                    for ($i=0; $i <= 31; $i++) { 
                        $selected = '';
                        if(date('j',$datum) == $i AND $datum != "")
                            $selected = 'selected="selected"';

                        $option_dny .= '<option value="'.$i.'" '.$selected.'>'.$i.'</option>';
                    }

                    $option_roky = '<option value="">-------</option>';
                    for ($i=1930; $i <= date('Y')-10; $i++) { 
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
                
            $html .= '<tr>
                <th><label for="bp_meta_'.$extra_field_id.'">'.$field->name.'</label></th>

                <td>
                    '.$input.'
                    <span class="description"></span>
                </td>
            </tr>';

        }
    }

    echo $html;//return
}

add_action( 'show_user_profile', 'budkutil_show_extra_profile_fields' );
add_action( 'edit_user_profile', 'budkutil_show_extra_profile_fields' );

function budkutil_show_extra_profile_fields( $user ) { 
    global $wpdb;

    ?>

    <h3>BuddyPress - profilové informace</h3>

    <table class="form-table">

    <?
    $groups = $wpdb->get_results("SELECT * FROM wp_bp_xprofile_groups");
    extra_profile_fields_groups($groups, $user);
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

    $extra_fields = $wpdb->get_results("SELECT * FROM wp_bp_xprofile_fields");

    foreach ($extra_fields as $field) {
        $extra_field_id = $field->id;
        $post_field = $_POST['bp_meta_'.$extra_field_id];

        if($field->type == "datebox")
        {
            $post_field = $_POST[$extra_field_id.'_day']." ".$_POST[$extra_field_id.'_month']." ".$_POST[$extra_field_id.'_year'];
        }

        if(is_array($post_field))
            $post_field = implode(';', $post_field);

        //foreach ($post_field as $value) 
        update_usermeta( $user_id, 'bp_meta_'.$extra_field_id, $post_field);
    }
}

add_action('admin_menu', 'bk_sady_parametru');
function bk_sady_parametru()
{
    if (function_exists('add_submenu_page'))
    {
        //$parent, $page_title, $menu_title, $access_level, $file, $function = ''
        add_submenu_page('edit.php?post_type=product','Sady parametrů','Sady parametrů', 1, 'sady','sady_page');
    }
}

function bk_sady_parametru_menu($query) {
     global $pagenow;

     if( 'edit.php?post_type=product' != $pagenow || !$query->is_admin )
     return $query;

     if( !current_user_can( 'manage_options' ) ) {
     global $user_ID;
     $query->set('author', $user_ID );
     }
     return $query;
}
add_filter('pre_get_posts', 'bk_sady_parametru_menu');


add_action('admin_menu', 'bk_parametry');
function bk_parametry()
{
    if (function_exists('add_submenu_page'))
    {
        //$parent, $page_title, $menu_title, $access_level, $file, $function = ''
        add_submenu_page('edit.php?post_type=product','Parametry','Parametry', 1, 'parametry','parametry_page');
    }
}

function bk_patametry($query) {
     global $pagenow;

     if( 'edit.php?post_type=product' != $pagenow || !$query->is_admin )
     return $query;

     if( !current_user_can( 'manage_options' ) ) {
     global $user_ID;
     $query->set('author', $user_ID );
     }
     return $query;
}
add_filter('pre_get_posts', 'bk_patametry');

function budkutil_edit_product_columns( $existing_columns ) {
    global $woocommerce;
    $columns["product_owner"] = "Přidal";

    return $columns;
}

add_filter( 'manage_edit-product_columns', 'budkutil_edit_product_columns' );

function budkutil_custom_product_columns( $column ) {
    global $post, $woocommerce, $the_product;

    switch ($column) {
        case "product_owner" :
            echo '<a href="/wp-admin/user-edit.php?user_id='.$post->post_author.'">'.get_userdata($post->post_author)->display_name.'</a>';
        break;
    }
}

add_action('manage_product_posts_custom_column', 'budkutil_custom_product_columns', 2 );

function budkutil_provize_order($postID) {
    global $wpdb;

    echo '<div style="clear: both"></div></div><div class="totals_group">
    <h4>Provize:</h4><br />';

    $produkty = $wpdb->get_results("SELECT * FROM wp_woocommerce_order_items WHERE order_id='".$postID."'");
    foreach ($produkty as $produkt) {

        $ks = $wpdb->get_var("SELECT meta_value FROM wp_woocommerce_order_itemmeta WHERE meta_key='_qty' AND order_item_id='".$produkt->order_item_id."'");
        $cena_order = $wpdb->get_var("SELECT meta_value  FROM wp_woocommerce_order_itemmeta WHERE meta_key='_line_total' AND order_item_id='".$produkt->order_item_id."'");
        $id_product = $wpdb->get_var("SELECT meta_value  FROM wp_woocommerce_order_itemmeta WHERE meta_key='_product_id' AND order_item_id='".$produkt->order_item_id."'");
        $cena_produkt = $wpdb->get_var("SELECT meta_value  FROM wp_postmeta WHERE meta_key='_regular_price' AND post_id='".$id_product."'");

        $provize_ks = $cena_order-$cena_produkt;
        $provize = $provize_ks*$ks;
        $provize_celkem += $provize;

        echo '<h4><i>'.$produkt->order_item_name.'</i></h4>
        Provize ks: '.$provize_ks.' Kč<br />
        Provize celkem: '.$provize.'Kč<br />';
    }

    echo "<br /><b>Celkem: $provize_celkem Kč</b>";
}

add_action( 'woocommerce_admin_order_totals_after_shipping', 'budkutil_provize_order', $post->ID );


function category_tree(array $zaznamy, $parentId = 0) {
    global $wpdb;

    /*$neco = $wpdb->get_results("SELECT t1.term_id AS lev1, t2.term_id as lev2, t3.term_id as lev3, t4.term_id as lev4
    FROM wp_term_taxonomy AS t1
    LEFT JOIN wp_term_taxonomy AS t2 ON t2.parent = t1.term_id
    LEFT JOIN wp_term_taxonomy AS t3 ON t3.parent = t2.term_id
    LEFT JOIN wp_term_taxonomy AS t4 ON t4.parent = t3.term_id
    WHERE t1.taxonomy='product_cat'");*/
    
    $vetev = array();

    foreach ($zaznamy as $zaznam) {
        if ($zaznam->parent == $parentId) {
            $children = category_tree($zaznamy, $zaznam->term_id);
            if ($children) {
                $zaznam->children = $children;
            }
            $vetev[] = $zaznam;
        }
    }

    return $vetev;
}

function seznam($data_array, $i = 0, $list_tag = 'ul') {
    global $wpdb;

    if ($list_tag != 'ul' && $list_tag != 'ol')
        $list_tag = 'ul';

    if (!is_array($data_array) || empty($data_array))
        return;

    $kat_nazev = $wpdb->get_var("SELECT name FROM $wpdb->terms WHERE term_id='".$data_array[0][parent]."'");

    if($data_array[0][parent] == 0)
        $kat_nazev = "Hlavní kategorie";
    else
        $kat_nazev = '<input type="checkbox" name="produkt_cat[]" value="'.$data_array[0][parent].'" /> '.$kat_nazev;

    echo '<li><span class="folder">'.$kat_nazev.'</span><'.$list_tag.'>';
    
    foreach ($data_array as $element) {
        $kat_nazev = $wpdb->get_var("SELECT name FROM $wpdb->terms WHERE term_id='".$element[term_id]."'");

        $nadrazeno = $wpdb->get_var("SELECT SUM(1) FROM wp_term_taxonomy WHERE parent='".$element[term_id]."'");

        if($nadrazeno == 0)
            echo '<li><span class="file"><input type="checkbox" name="produkt_cat[]" value="'.$element[term_id].'" /> '.$kat_nazev.'</span></li>';

        if (is_array($element[children])) {
            seznam($element[children], ++$i);
        }
    }
    echo '</'.$list_tag.'></li>';
}

function set_tmbn($post, $file) {
    global $wpdb;

    $obrazek_id = $wpdb->get_var("SELECT post_id FROM wp_postmeta WHERE meta_value REGEXP '".$file."' ORDER BY meta_id DESC");
    //set_post_thumbnail($_POST['produkt_id'], $obrazek_id);echo $_POST['produkt_id']."$$".$obrazek_id;
    add_post_meta($post, '_thumbnail_id', $obrazek_id);
}

function pridat_produkt_uzivatel( $atts ) {
    global $wpdb;

    if(isset($_POST['pridat_novy_produkt']))
    {
        $novy_produkt_nazev         = sanitize_text_field($_POST['novy_produkt_nazev']);
        $novy_produkt_popis         = sanitize_text_field($_POST['novy_produkt_popis']);
        $novy_produkt_cena          = filter_var($_POST['novy_produkt_cena'], FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
        $novy_produkt_ks            = filter_var($_POST['novy_produkt_ks'], FILTER_SANITIZE_NUMBER_INT);
        $novy_produkt_viditelnost   = $_POST['novy_produkt_viditelnost'];
        $novy_produkt_kategorie     = $_POST['novy_produkt_nazev'];
        $poradi_attachs             = explode('|', $_POST['poradi_attachs']);
        $main_attach                = $_POST['main_attach'];
        $produkt_cat                = $_POST['produkt_cat'];
        $sada                       = $_POST['sada'];
        

        $post = array(
          'post_author'    => wp_get_current_user(), 
          'post_content'   => $novy_produkt_popis, 
          'post_date'      => date('Y-m-d H:i:s'),
          'post_status'    => ($novy_produkt_viditelnost == "true") ? 'publish' : 'draft',
          'post_title'     => $novy_produkt_nazev, 
          'post_type'      => 'product'
        );  

        wp_insert_post($post);
        //$last = wp_get_recent_posts( '1');
        $last_id = $wpdb->insert_id;//$last['0']['ID'];
        $wp_upload_dir = wp_upload_dir();

        require_once( ABSPATH . 'wp-admin/includes/image.php' );

        $dir = ABSPATH.'wp-content/plugins/budkutil/js/tmp_img/';
        $mine = array("image/jpeg","image/pjpeg","image/png","image/gif");
        $attachments = array();
        if (is_dir($dir)) {
            if ($dh = opendir($dir)) {
                while (($file = readdir($dh)) !== false) {
                    if(preg_match('/^'.$_POST['edit_timestamp'].'/i', $file))
                    {
                        if(in_array(mime_content_type($dir . $file),$mine))
                        {    
                            $wp_filetype = wp_check_filetype(basename($file), null );

                            rename($dir . $file, $wp_upload_dir['basedir'] . '/' . basename( $dir . $file ));

                            $attachment = array(
                             'guid' => $wp_upload_dir['basedir'] . '/' . basename( $dir . $file ), 
                             'post_mime_type' => $wp_filetype['type'],
                             'post_title' => preg_replace( '/\.[^.]+$/', '', basename( $dir . $file ) ),
                             'post_content' => array_search($file, $poradi_attachs),
                             'post_status' => 'inherit'
                            );

                            $attach_id = wp_insert_attachment( $attachment, $wp_upload_dir['basedir'] . '/' . basename( $dir . $file ), $last_id );

                            if($main_attach == $file)
                                set_tmbn($last_id, $file);

                            $attach_data = wp_generate_attachment_metadata( $attach_id, $wp_upload_dir['basedir'] . '/' . basename( $dir . $file ) );
                            wp_update_attachment_metadata( $attach_id, $attach_data );

                            array_push($attachments, $attach_id);
                        }
                    }
                }
                closedir($dh);
            }
        }   

        wp_set_object_terms( $last_id, $product_cat, 'product_cat' );

        foreach ($sada as $parametr) {
            
            $sada = $wpdb->get_var("SELECT parametr_id FROM bk_hodnoty WHERE hodnota_id='".$parametr."'");
            
            $wpdb->insert('bk_produkty_sady', 
                array( 
                    'produkt_id' => $last_id, 
                    'sada_id' => $sada, 
                    'parametr_id' => $parametr, 
                    'time' => time()
                )
            );
        }

        add_post_meta($last_id, '_product_image_gallery', implode(',', $attachments));
        add_post_meta($last_id, '_regular_price', $novy_produkt_cena);
        add_post_meta($last_id, '_stock', $novy_produkt_ks);
        add_post_meta($last_id, '_manage_stock', 'yes');
        if($novy_produkt_ks > 0)
            add_post_meta($last_id, '_stock_status', 'instock');

        wp_set_post_terms( $last_id, $_POST['produkt_cat']);
        
        $pridan = true;
        //add error report ##
    }

    
    if($pridan == true)
    {
        $form = "Produkt přidán";
    }
    else
    {
        $upload = '
            <link rel="stylesheet" href="/wp-content/plugins/budkutil/js/img-up/assets/css/styles.css" />
            <script type="text/javascript" src="/wp-content/plugins/budkutil/js/dragsort/jquery.dragsort-0.5.1.min.js"></script>

            <style type="text/css">               
                #list1 {list-style-type:none; margin:0px; }
                #list1 li { float:left; padding:5px; width:300px; height:300px; }
                .placeHolder { width: 300px; height: 300px; opacity: 0.5; border: dashed 3px gray !important; -webkit-border-radius: 15px;
-moz-border-radius: 15px;
border-radius: 15px;
position: relative;
top: 50px;}
.uploaded {display: block !important}
            </style>

            <div id="dropbox">
                <span class="message"><noscript>Pro nahrávání obrázků je vyžadován povolený JavaScript.</noscript></span>
            
                <ul id="list1"></ul>   

                <div id="btn_vybrat_soubor">Vybrat soubor</div>
            </div>

            <input name="poradi_attachs" type="hidden" />
            <input name="main_attach" type="hidden" />
                              
            <input id="edit_timestamp" type="hidden" name="edit_timestamp" value="'.time().'" />

          <script>
            jQuery(".dad_star").live("click", function(){
                var theone = jQuery(this).parent().parent().hasClass("main");
                var file = jQuery(this).parent().parent().parent().attr("title");

                jQuery("#dropbox").find(".uploaded").removeClass("main");
                jQuery("#dropbox").find(".dad_star").attr("src", "/wp-content/plugins/budkutil/js/img-up/assets/img/star-dark.png");

                if(theone == false)
                {
                    jQuery(this).parent().parent().addClass("main");
                    jQuery(this).attr("src", "/wp-content/plugins/budkutil/js/img-up/assets/img/star.png");
                    jQuery("input[name=main_attach]").val(file);
                }
            });

          jQuery(".dad_close").live("click", function(){
            
                  var adr = jQuery(this).parent().find(".upedimg").attr("title");
                  
                  jQuery.get("/wp-content/plugins/budkutil/js/do_kose.php", { time: jQuery(\'#edit_timestamp\').val(), img: adr, klic: "f9dks"} ,
                  function(data){
                    //alert("Data Loaded: " + data);
                  });
              
                jQuery(this).parent().parent().parent().fadeOut( function() {
                    jQuery(this).parent().parent().parent().toggle("slow");
                });
            }); 

var isFileAPIEnabled = function() {
  return !!window.FileReader;
};

if(isFileAPIEnabled())
    var msg = "Obrázky vyberte kliknutím na tlačítko níže nebo přetáhnutím obrázku z disku na tuto plochu. <br /><i>(podporované formáty: PNG, JPG, GIF)</i>";
else
    var msg = "Obrázky vyberte kliknutím na tlačítko níže. <br /><i>(podporované formáty: PNG, JPG, GIF)</i>";

jQuery("#dropbox > .message").html(msg);

jQuery("#btn_vybrat_soubor").click( function() {
    jQuery("#one-specific-file").click();
});

jQuery("#list1").dragsort({ dragSelector: "li", dragBetween: true, dragEnd: saveOrder, placeHolderTemplate: "<li class=\'placeHolder\'></li>" });

function saveOrder() {
            var data = jQuery("#list1 li").map(function() { return jQuery(this).find(".upedimg").attr("title"); }).get();
            jQuery("input[name=poradi_attachs]").val(data.join("|"));
        };
          </script>
                  
            <script src="/wp-content/plugins/budkutil/js/img-up/assets/js/jquery.filedrop.js"></script>

            <script src="/wp-content/plugins/budkutil/js/img-up/assets/js/script.js"></script>

            <script src="/wp-content/plugins/budkutil/js/img-up/jquery.ajaxfileupload.js"></script>

            <script>
            
    
  


            jQuery("#one-specific-file").ajaxfileupload({
              "action": "/wp-content/plugins/budkutil/js/nahraj_obrazek.php?way=input&time="+jQuery("#edit_timestamp").val()
            });
            </script>';

        $links = '
        <link rel="stylesheet" href="/wp-content/plugins/budkutil/js/tree/jquery.treeview.css" />
        <link href="/wp-content/plugins/budkutil/js/select/select2.css" rel="stylesheet"/>
        <link rel="stylesheet" href="/wp-content/plugins/budkutil/js/numput/css/style.css">
        
        
        <script src="/wp-content/plugins/budkutil/js/numput/js/incrementing.js" type="text/javascript"></script>
        <script src="/wp-content/plugins/budkutil/js/tree/lib/jquery.cookie.js" type="text/javascript"></script>
        <script src="/wp-content/plugins/budkutil/js/tree/jquery.treeview.js" type="text/javascript"></script>
        <script src="/wp-content/plugins/budkutil/js/select/select2.js" type="text/javascript"></script>
        <script src="/wp-content/plugins/budkutil/js/validate/jquery.validate.js" type="text/javascript"></script>
        <script src="/wp-content/plugins/budkutil/js/validate/messages_cs.js" type="text/javascript"></script>

       <style>
#novy_produkt_form .error {
    min-width: 30px;
    padding-left: 40px;
    position: absolute;
    width: auto !important;
}

#novy_produkt_form label {
    text-align: left;
    width: 250px;
}
label.error {
    background: url("/wp-content/plugins/budkutil/js/validate/error.png") no-repeat scroll left center rgba(0, 0, 0, 0);
    color: #FF0000;
    display: inline-block;
    font-weight: bold;
    height: 50px;
    min-width: 24px;
    text-indent: 0;
}
label.valid {
    background: url("/wp-content/plugins/budkutil/js/validate/valid.png") no-repeat scroll left center rgba(0, 0, 0, 0) !important;
    display: inline-block;
    height: 50px;
    text-indent: -9999px !important;
    width: 24px;
    height: 24px !important;
}
       </style> ';

        $script = '<script type="text/javascript">
        jQuery(document).ready(function(){
            jQuery("#browser").treeview({
                toggle: function() {
                    console.log("%s was toggled.", jQuery(this).find(">span").text());
                }
            });
            
            jQuery("#add").click(function() {
                var branches = jQuery("<li><span class=\'folder\'>New Sublist</span><ul>" + 
                    "<li><span class=\'file\'>Item1</span></li>" + 
                    "<li><span class=\'file\'>Item2</span></li></ul></li>").appendTo("#browser");
                jQuery("#browser").treeview({
                    add: branches
                });
            });
        });
        </script>';


        $zaznamy = $wpdb->get_results("SELECT * FROM wp_term_taxonomy WHERE taxonomy='product_cat'");
        $tree = category_tree($zaznamy);
        $array = json_decode(json_encode($tree), true);
        ob_start();
        echo '<ul id="browser" class="filetree treeview-famfamfam">';
        seznam($array);
        echo "</ul>";
        $tree = ob_get_clean();

        $form = '
        <form enctype="multipart/form-data">
            <input type="file" name="pic" id="one-specific-file" style="display: none"/>
        </form>
        <form method="post" id="novy_produkt_form">
            <table>
                <tr>
                    <td>Název:</td>
                    <td>
                        <input type="text" value="'.$_POST['novy_produkt_nazev'].'" name="novy_produkt_nazev" />
                    </td>
                </tr>
                <tr>
                    <td>Popis:</td>
                    <td>
                        <textarea rows="5" cols="30" name="novy_produkt_popis"></textarea>
                    </td>
                </tr>
                <tr>
                    <td>Kategorie:</td>
                    <td>
                        '.$tree.'
                    </td>
                </tr>
                <tr>
                    <td>Cena:</td>
                    <td>
                        <input type="text" value="" name="novy_produkt_cena" size="5" /> Kč
                    </td>
                </tr>
                <tr>
                    <td>Kusů:</td>
                    <td>
                        <div class="numbers-row">
                            <input type="text" name="novy_produkt_ks" value="1" size="2" /> Ks
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Veřejný:</td>
                    <td>
                        <input type="checkbox" value="true" name="novy_produkt_viditelnost" checked="checked" /> Produkt mohou vidět všichni uživatelé 
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        '.$upload.'
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="attr_row">
                            <select name="sada[]" class="attribute_taxonomy">
                                <option value="">Vyberte parametr</option>';
                                
                                $sady = $wpdb->get_results("SELECT * FROM bk_parametry ORDER BY parametr_nazev");
                                foreach ($sady as $sada)
                                    $form .= '<option value="'.$sada->parametr_id.'">'.$sada->parametr_nazev.'</option>';
                                
                                $form .=  '
                            </select>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Vytvořit produkt" name="pridat_novy_produkt" />
                    </td>
                </tr>
            </table>
        </form>'; 

    $script_down = "<script>
        function format(state) {
            var originalOption = state.element;
            //if (!state.id) return state.text; // optgroup
            return '<img class=\"nahled_hodnota\" src=\"/wp-content/plugins/budkutil/up_img/' + jQuery(originalOption).attr('alt') + '\"/>' + state.text;
        }

        jQuery('.attribute_taxonomy').live('change', function () {

            var select_element  = jQuery(this);

            if(select_element.val() != \"\")
            {
                var label_text      = select_element.find('option:selected').html()
                var sada            = select_element.val();
                
                var aktivni = new Array();
                   for(i=0; i <= jQuery('.nazev_sady').length; i++)
                        if(jQuery('.nazev_sady:eq('+i+')').attr('id') != null)
                            aktivni.push(jQuery('.nazev_sady:eq('+i+')').attr('id'));                    

                jQuery.get('/wp-content/plugins/budkutil/js/product_parametry.php', { get_sada: sada, key: 'fU7i2m', get_aktivni: aktivni }, function(data) { 
                    var vyber_hodnoty = data;

                    jQuery.get('/wp-content/plugins/budkutil/js/product_parametry.php', { get_aktivni: aktivni }, function(data) { 
                        var vnuk = data;

                        select_element.after(vyber_hodnoty);  
                        select_element.parent().after(vnuk);

                        select_element.parent().find('.vyber_hodnoty').select2({
                            formatResult: format,
                            formatSelection: format,
                            escapeMarkup: function(m) { return m; }
                        });

                        select_element.replaceWith(label_text);
                    });  
                });
            }
        });     

        jQuery('.delete_sada a').live('click', function () {  
            jQuery(this).parent().parent().parent().remove();
        }); 

jQuery('#novy_produkt_form').validate({
        rules: {
          novy_produkt_nazev: {
            minlength: 2
          },
          novy_produkt_popis: {
            minlength: 20,
            maxlength: 500
          },
          novy_produkt_cena: {
            digits: true,
            minlength: 1
          },
          novy_produkt_ks: {
            number: true,
            minlength: 1
          }
        },
            highlight: function(element) {
                jQuery(element).closest('.control-group').removeClass('success').addClass('error');
            },
            success: function(element) {
                element.addClass('valid').closest('.control-group').removeClass('error').addClass('success');
            }
      });

function preload(arrayOfImages) {
    jQuery(arrayOfImages).each(function(){
        jQuery('<img/>')[0].src = this;
    });
}

preload([
    '/wp-content/plugins/budkutil/js/validate/valid.png',
]);
        </script>";
    }

    if(is_user_logged_in())
        return $links.$script.$form.$script_down;
    else
        return "Must log in";
}
add_shortcode( 'pridat_produkt', 'pridat_produkt_uzivatel' );



function nastaveni_uzivatel() {
    global $wpdb;
    $user = get_userdata(get_current_user_id());
    
    if($_POST['ulozit_nastaveni_uzivtel'])
        my_save_extra_profile_fields($user->ID); 

    bp_activity_add(array(
    'action' => 'sdasd',
    'component' => 'blog_post',
    'type' => 'activity_update',
    'primary_link' => get_permalink($post_id),
    'user_id' => 29
     ));

   

    $form = '
    <form method="post">
        <table>
            '.extra_profile_fields_groups(
                $wpdb->get_results("SELECT * FROM wp_bp_xprofile_groups WHERE id='2'")
                , $user).'
        </table>
    
        <table>
            '.extra_profile_fields_groups(
                $wpdb->get_results("SELECT * FROM wp_bp_xprofile_groups WHERE id='4'")
                , $user).'
        </table>

        <table>
            '.extra_profile_fields_groups(
                $wpdb->get_results("SELECT * FROM wp_bp_xprofile_groups WHERE id='5'")
                , $user).'
        </table>

        <input type="submit" name="ulozit_nastaveni_uzivtel" value="Uložit nastavení" />
    </form>
    ';

    return $form;
}
add_shortcode( 'nastaveni_uzivatel', 'nastaveni_uzivatel' );
?>
