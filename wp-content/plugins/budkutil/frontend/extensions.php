<?
add_filter( 'post_thumbnail_html', 'remove_attributes', 10 );
add_filter( 'image_send_to_editor', 'remove_attributes', 10 );

function remove_attributes( $html ) {
   $html = preg_replace( '/(width|height)="\d*"\s/', "", $html );
   return $html;
}

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
        $kat_nazev = '<input type="checkbox" class="produkt_cat" name="produkt_cat[]" value="'.$data_array[0][parent].'" /> '.$kat_nazev;

    echo '<li><span class="folder">'.$kat_nazev.'</span><'.$list_tag.'>';
    
    foreach ($data_array as $element) {
        $kat_nazev = $wpdb->get_var("SELECT name FROM $wpdb->terms WHERE term_id='".$element[term_id]."'");

        $nadrazeno = $wpdb->get_var("SELECT SUM(1) FROM wp_term_taxonomy WHERE parent='".$element[term_id]."'");

        if($nadrazeno == 0)
            echo '<li><span class="file"><input type="checkbox" class="produkt_cat" name="produkt_cat[]" value="'.$element[term_id].'" /> '.$kat_nazev.'</span></li>';

        if (is_array($element[children])) {
            seznam($element[children], ++$i);
        }
    }
    echo '</'.$list_tag.'></li>';
}

function set_tmbn($post, $file) {
    global $wpdb;

    $obrazek_id = $wpdb->get_var("SELECT post_id FROM wp_postmeta WHERE meta_value REGEXP '".$file."' ORDER BY meta_id DESC");
    //set_post_thumbnail($post, $obrazek_id);//echo $_POST['produkt_id']."$$".$obrazek_id;
    add_post_meta($post, '_thumbnail_id', $obrazek_id);
}

function budkutil_adding_scripts() {
    wp_register_script('dragsort', "/wp-content/plugins/budkutil/js/dragsort/jquery.dragsort-0.5.1.min.js", array('jquery'),'1.1', true);
    wp_register_script('img-up-drag', "/wp-content/plugins/budkutil/js/img-up/assets/js/jquery.filedrop.js", array('jquery'),'1.1', true);
    wp_register_script('img-up', "/wp-content/plugins/budkutil/js/img-up/assets/js/script.js", array('jquery'),'1.1', true);
    wp_register_script('img-up-button', "/wp-content/plugins/budkutil/js/img-up/jquery.ajaxfileupload.js", array('jquery'),'1.1', true);
    wp_register_script('numput', "/wp-content/plugins/budkutil/js/numput/js/incrementing.js", array('jquery'),'1.1', true);
    wp_register_script('tree-cookires', "/wp-content/plugins/budkutil/js/tree/lib/jquery.cookie.js", array('jquery'),'1.1', true);
    wp_register_script('tree', "/wp-content/plugins/budkutil/js/tree/jquery.treeview.js", array('jquery'),'1.1', true);
    wp_register_script('select2', "/wp-content/plugins/budkutil/js/select/select2.js", array('jquery'),'1.1', true);
    wp_register_script('validate-msgs', "/wp-content/plugins/budkutil/js/validate/messages_cs.js", array('jquery'));
    wp_register_script('validate', "/wp-content/plugins/budkutil/js/validate/jquery.validate.js", array('jquery'));
    wp_register_script('main-new-product', "/wp-content/plugins/budkutil/js/new_product.js", array('jquery'),'1.1', true);
    
    wp_enqueue_script('dragsort');
    wp_enqueue_script('img-up-drag');
    wp_enqueue_script('img-up');
    wp_enqueue_script('img-up-button');
    wp_enqueue_script('tree-cookires');
    wp_enqueue_script('tree');
    wp_enqueue_script('select2');
    wp_enqueue_script('validate');
    wp_enqueue_script('validate-msgs');
    wp_enqueue_script('main-new-product');
}

add_action( 'wp_enqueue_scripts', 'budkutil_adding_scripts' );

function budkutil_adding_styles() {
    wp_enqueue_style('select2', ABSPATH."wp-content/plugins/budkutil/js/select/select2.css");
    wp_enqueue_style('new_product', "/wp-content/plugins/budkutil/css/new_product.css");///wp-content/themes/twentytwelve

    wp_enqueue_script('select2');
    wp_enqueue_script('new_product');
}

add_action( 'wp_enqueue_scripts', 'budkutil_adding_styles' );

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
        $thumbnail = $poradi_attachs[0];
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

                            if($nahled == "" OR $file == $main_attach)
                                $nahled = $file;

                            $attach_data = wp_generate_attachment_metadata( $attach_id, $wp_upload_dir['basedir'] . '/' . basename( $dir . $file ) );
                            wp_update_attachment_metadata( $attach_id, $attach_data );

                            array_push($attachments, $attach_id);
                        }
                    }
                }
                closedir($dh);
            }
        }   

        set_tmbn($last_id, $nahled);
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
        echo "Produkt přidán";
    }
    else
    {
        $template = file_get_contents(ABSPATH."wp-content/plugins/budkutil/frontend/new_product_form.tpl");
       
        $zaznamy = $wpdb->get_results("SELECT * FROM wp_term_taxonomy WHERE taxonomy='product_cat'");
        $tree = category_tree($zaznamy);
        $array = json_decode(json_encode($tree), true);
        ob_start();
        echo '<ul id="browser" class="filetree treeview-famfamfam">';
        seznam($array);
        echo "</ul>";
        $tree = ob_get_clean();

        $sady = $wpdb->get_results("SELECT * FROM bk_parametry ORDER BY parametr_nazev");
        foreach ($sady as $sada)
            $sady_options .= '<option value="'.$sada->parametr_id.'">'.$sada->parametr_nazev.'</option>';

        $template = str_replace('{strom}', $tree, $template);
        $template = str_replace('{sady_parametru}', $sady_options, $template);      
        $template = str_replace('{time}', time(), $template);      
    }

    if(is_user_logged_in())
        return $template;
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