<?
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

    $parametry = $wpdb->get_results("SELECT * FROM bk_produkty_sady WHERE produkt_id='{$_GET['post']}'");
    foreach ($parametry as $parametr) {
        $vybrane_parametry[] = $parametr->parametr_id;
    }

    $parametry = implode(',', $vybrane_parametry);
    ?>
    <div id="budkutil_sady" class="panel wc-metaboxes-wrapper">

            <p class="toolbar">
                <div class="infobox_attr"></div>
            </p>

            <div class="woocommerce_attributes_sady wc-metaboxes">
                <?
                /*$sady = $wpdb->get_results("SELECT * FROM bk_produkty_sady WHERE produkt_id='".$_GET['post']."'");
                foreach ($sady as $sada) {
                    $sada_id = $sada->sada_id;
                    $parametr_id = $sada->parametr_id;

                    include ABSPATH."wp-content/plugins/budkutil/js/nastaveni_parametru_vypis.php";
                }*/
                ?>
                <div id="sady_parametru_wrapper">Nejprve je třeba vytvořit výrobek</div>
            </div>

            <p class="toolbar">
                <!--<button type="button" class="button button-primary add_attribute" id="add_sada">Přidat</button>
                <select name="sada" class="attribute_taxonomy">
                    <option value="">Vyberte sadu parametrů</option>
                    <?
                    $sady = $wpdb->get_results("SELECT * FROM bk_parametry ORDER BY parametr_nazev");
                    foreach ($sady as $sada) {
                        echo '<option value="'.$sada->parametr_id.'">'.$sada->parametr_nazev.'</option>';
                    }
                    ?>
                </select>-->

                <button type="button" class="button" id="save_sada">Uložit</button>
            </p>
        </div>
        <script>
        <? if(isset($_GET['post'])):?>
        jQuery( function() {
            var idecko = jQuery('#product_catchecklist').find('input:checked').filter(':last').val();
            var vybrane_sady = '<? echo $parametry;?>';
            
            jQuery.get("/wp-content/plugins/budkutil/js/parametry_new_product.php", { cid: idecko, sady: vybrane_sady} , function(data){
                jQuery('#sady_parametru_wrapper').html(data);
            });
        });
        <? else: ?>
        jQuery('#product_catchecklist > input').change( function() {
            var idecko = jQuery('#product_catchecklist').find('input:checked').filter(':last').val();
            var vybrane_sady = '<? echo $parametry;?>';
            
            jQuery.get("/wp-content/plugins/budkutil/js/parametry_new_product.php", { cid: idecko, sady: vybrane_sady} , function(data){
                jQuery('#sady_parametru_wrapper').html(data);
            });
        });
        <? endif; ?>

        jQuery('#product_catchecklist').find('input').click( function() {
            var parent_first  = jQuery(this).parent().parent().parent().parent().find('input').filter(':first');
            var idecko_first  = parent_first.val();
            
            var parent_sec    = parent_first.parent().parent().parent().parent().find('input').filter(':first');
            var idecko_sec    = parent_sec.val();
            
            jQuery('#product_catchecklist').find('input').attr('checked', false);
            jQuery(this).attr('checked', true);
            
            if(idecko_first != 0)
            {
                parent_first.attr('checked', true);
                
                    if(idecko_sec != 0)
                    {
                        parent_sec.attr('checked', true);
                    }
            }
        });

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

            jQuery('.infobox_attr').html("Ukládám...").show();

            var aktivni = jQuery('#sady_parametru_wrapper input:checked').serialize();

            jQuery.get('../wp-content/plugins/budkutil/js/product_parametry_save.php', { get_pid: <? echo $_GET['post'];?>, get_aktivni: aktivni }, function(data) { 
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
    $columns["like"] = "Like";

    return $columns;
}

add_filter( 'manage_edit-product_columns', 'budkutil_edit_product_columns' );

function budkutil_custom_product_columns( $column ) {
    global $post, $woocommerce, $the_product, $wpdb;

    switch ($column) {

        case "product_owner" :
            echo '<a href="/wp-admin/user-edit.php?user_id='.$post->post_author.'">'.get_userdata($post->post_author)->display_name.'</a>';
        break;

        case "like" :
            echo (int)$wpdb->get_var("SELECT SUM(1) AS pocet FROM bk_like WHERE produkt_id='".$the_product->id."'");
        break;
    }
}

add_action('manage_product_posts_custom_column', 'budkutil_custom_product_columns', 2 );




function my_column_register_sortable( $columns )
{
    $columns['like'] = 'like';
    return $columns;
}

add_filter("manage_edit-product_sortable_columns", "my_column_register_sortable" );


function neco( $vars ) {
    if (isset( $vars['orderby'] )) :
        if ( 'like' == $vars['orderby'] ) :
            $vars = array_merge( $vars, array(
                'meta_key'  => '_like',
                'orderby'   => 'meta_value_num'
            ) );
        endif;
    endif;

    return $vars;
}

add_filter( 'request', 'neco' );

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