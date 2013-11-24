<?
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
?>