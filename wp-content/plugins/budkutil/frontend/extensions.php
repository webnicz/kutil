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
            $children = category_tree($zaznamy, $zaznam->term_taxonomy_id);
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

    if($data_array[0][parent] != 0)
        echo '<li><a href="#">'.$kat_nazev.'</a><'.$list_tag.'>';
    
    foreach ($data_array as $element) {
        $kat_nazev = $wpdb->get_var("SELECT name FROM $wpdb->terms WHERE term_id='".$element[term_id]."'");

        $nadrazeno = $wpdb->get_var("SELECT SUM(1) FROM wp_term_taxonomy WHERE parent='".$element[term_taxonomy_id]."'");

        if($nadrazeno == 0)
            echo '<li><a href="#"><input type="checkbox" class="produkt_cat" name="produkt_cat[]" value="'.$element[term_taxonomy_id].'" /> '.$kat_nazev.'</a></li>';

        if (is_array($element[children])) {
            seznam($element[children], ++$i);
        }
    }
    echo '</'.$list_tag.'></li>';
}

function must_log_in() {
    return file_get_contents(ABSPATH."wp-content/plugins/budkutil/frontend/must_log_in.tpl");
}

function get_template_bk($side, $name) {
    return file_get_contents(ABSPATH."wp-content/plugins/budkutil/".$side."/".$name.".tpl");
}

function set_tmbn($post, $file) {
    global $wpdb;

    $q = "SELECT post_id FROM wp_postmeta WHERE meta_value REGEXP '".$file."' ORDER BY meta_id DESC";
    $obrazek_id = $wpdb->get_var($q);
    //set_post_thumbnail($post, $obrazek_id);//echo $_POST['produkt_id']."$$".$obrazek_id;
    add_post_meta($post, '_thumbnail_id', $obrazek_id);
}

function budkutil_adding_scripts() {
    wp_register_script('dragsort'           , "/wp-content/plugins/budkutil/js/dragsort/jquery.dragsort-0.5.1.min.js", array('jquery'),'1.1', true);
    wp_register_script('img-up-drag'        , "/wp-content/plugins/budkutil/js/img-up/assets/js/jquery.filedrop.js", array('jquery'),'1.1', true);
    wp_register_script('img-up'             , "/wp-content/plugins/budkutil/js/img-up/assets/js/script.js", array('jquery'),'1.1', true);
    wp_register_script('img-up-button'      , "/wp-content/plugins/budkutil/js/img-up/jquery.ajaxfileupload.js", array('jquery'),'1.1', true);
    wp_register_script('numput'             , "/wp-content/plugins/budkutil/js/numput/js/incrementing.js", array('jquery'),'1.1', true);
    wp_register_script('tree-cookires'      , "/wp-content/plugins/budkutil/js/tree/lib/jquery.cookie.js", array('jquery'),'1.1', true);
    wp_register_script('tree'               , "/wp-content/plugins/budkutil/js/tree/jquery.treeview.js", array('jquery'),'1.1', true);
    wp_register_script('select2'            , "/wp-content/plugins/budkutil/js/select/select2.js", array('jquery'),'1.1', true);
    wp_register_script('validate-msgs'      , "/wp-content/plugins/budkutil/js/validate/messages_cs.js", array('jquery'));
    wp_register_script('validate'           , "/wp-content/plugins/budkutil/js/validate/jquery.validate.js", array('jquery'));
    wp_register_script('main-new-product'   , "/wp-content/plugins/budkutil/js/new_product.js", array('jquery'),'1.1', true);

    wp_register_script('kategorie1'         , "/wp-content/plugins/budkutil/js/kategorie/scripts/handlebars.js", array('jquery'),'1.1', true);
    wp_register_script('kategorie2'         , "/wp-content/plugins/budkutil/js/kategorie/scripts/jquery.taxonomyBrowser.js", array('jquery'),'1.1', true);
    wp_register_script('kategorie3'         , "/wp-content/plugins/budkutil/js/kategorie/scripts/jquery.taxonomyBrowser.keys.js", array('jquery'),'1.1', true);
    wp_register_script('scrollto'           , "/wp-content/plugins/budkutil/js/jquery.scrollTo-1.4.3.1.js", array('jquery'),'1.1', true);
    //wp_register_script('select2cs'          , "/wp-content/plugins/budkutil/js/select/select2_locale_cs.js", array('jquery'),'1.1', true);
    //wp_register_script('onleave'            , "/wp-content/plugins/budkutil/js/onleave/jquery.pageleave.js", array('jquery'),'1.1', true);
    
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
    wp_enqueue_script('kategorie1');
    wp_enqueue_script('kategorie2');
    wp_enqueue_script('kategorie3');
    wp_enqueue_script('scrollto');
    //wp_enqueue_script('select2cs');
    //wp_enqueue_script('onleave');
}

add_action( 'wp_enqueue_scripts', 'budkutil_adding_scripts' );

function budkutil_adding_styles() {
    wp_enqueue_style('select2', "/wp-content/plugins/budkutil/js/select/select2.css");
    wp_enqueue_style('new_product', "/wp-content/plugins/budkutil/css/new_product.css");
    wp_enqueue_style('kategorie', "/wp-content/plugins/budkutil/css/kategorie.css");///wp-content/themes/twentytwelve

    wp_enqueue_script('select2');
    wp_enqueue_script('new_product');
    wp_enqueue_script('kategorie');
}

add_action( 'wp_enqueue_scripts', 'budkutil_adding_styles' );

function clear_urls($url) {
    $chunks = parse_url($url[0]);
    $domena = $chunks[scheme]."://".$chunks[host];

    return str_replace($domena, '', $url[0]);
}

function pn_get_attachment_id_from_url( $attachment_url = '' ) {
 
    global $wpdb;
    $attachment_id = false;
 
    if ( '' == $attachment_url )
        return;
 
    $upload_dir_paths = wp_upload_dir();

    if ( false !== strpos( $attachment_url, $upload_dir_paths['path'] ) ) {

        $attachment_url = preg_replace( '/-\d+x\d+(?=\.(jpg|jpeg|png|gif)$)/i', '', $attachment_url );
        $attachment_url = str_replace( $upload_dir_paths['path'] . '/', '', $attachment_url );
 
        $attachment_id = $wpdb->get_var( $wpdb->prepare( "SELECT wposts.ID FROM $wpdb->posts wposts, $wpdb->postmeta wpostmeta WHERE wposts.ID = wpostmeta.post_id AND wpostmeta.meta_key = '_wp_attached_file' AND wpostmeta.meta_value = '%s' AND wposts.post_type = 'attachment'", $attachment_url ) );
    }
    return $attachment_id;
}

function attachment_is_asociated($file, $pid) {
    global $wpdb;
    $attachment_id = false;
    $attachment_url = ABSPATH.'wp-content/uploads/'.$file;

    if ( '' == $attachment_url )
        return;
 
    $upload_dir_paths = wp_upload_dir();

    if ( false !== strpos( $attachment_url, $upload_dir_paths['path'] ) ) {

        $attachment_url = preg_replace( '/-\d+x\d+(?=\.(jpg|jpeg|png|gif)$)/i', '', $attachment_url );
        $attachment_url = str_replace( $upload_dir_paths['path'] . '/', '', $attachment_url );
 
        $attachment = $wpdb->get_results( $wpdb->prepare( "SELECT * FROM $wpdb->posts wposts, $wpdb->postmeta wpostmeta WHERE wposts.ID = wpostmeta.post_id AND wpostmeta.meta_key = '_wp_attached_file' AND wpostmeta.meta_value = '%s' AND wposts.post_type = 'attachment' AND wposts.post_parent = '".$pid."'", $attachment_url ) );
    }

    return ($attachment[0]->post_parent == $pid) ? true : false;//$attachment_id;//(empty($attachment_id)) ? "false" : "true";
}

function pridat_produkt_uzivatel( $atts ) {
    global $wpdb;
    global $wp_query;

    $PRODUCT_ID = $wp_query->query_vars['page'];

    if(isset($_POST['pridat_novy_produkt']))
    {
        $novy_produkt_nazev         = sanitize_text_field($_POST['novy_produkt_nazev']);
        $novy_produkt_popis         = strip_tags($_POST['novy_produkt_popis'], '<a><abbr><acronym><b><br><div><h1><h2><h3><h4><h5><h6><hr><i><li><small><span><em><big><strong><ul><ol><p><dl><dt><dd>');
        $novy_produkt_cena          = filter_var($_POST['novy_produkt_cena'], FILTER_SANITIZE_NUMBER_FLOAT, FILTER_FLAG_ALLOW_FRACTION);
        $novy_produkt_ks            = filter_var($_POST['novy_produkt_ks'], FILTER_SANITIZE_NUMBER_INT);
        $novy_produkt_viditelnost   = $_POST['novy_produkt_viditelnost'];
        $novy_produkt_kategorie     = $_POST['novy_produkt_nazev'];
        $poradi_attachs             = explode('|', $_POST['poradi_attachs']);
        $main_attach                = $_POST['main_attach'];
        $produkt_cat                = $_POST['vybrana_kategorie'];
        $kategorie_frst             = $_POST['kategorie_frst'];
        $kategorie_sec              = $_POST['kategorie_sec'];
        $sada                       = $_POST['sada'];
        $tagy                       = $_POST['tagy'];
        $sada                       = $_POST['sada'];

        $regex = "/(http|https|ftp|ftps)\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,3}(\/\S*)?/";
        $novy_produkt_popis = stripslashes(preg_replace_callback($regex, "clear_urls", $novy_produkt_popis));
        
        //$_POST['edit_timestamp'] > (time()-15) AND 
        if(!empty($produkt_cat) AND !empty($_POST['poradi_attachs']) AND !empty($novy_produkt_nazev) AND !empty($novy_produkt_popis) AND !empty($novy_produkt_cena) AND !empty($novy_produkt_ks) AND !empty($novy_produkt_kategorie))
        {

            if($PRODUCT_ID > 0)
            {
                $post = array(
                  'ID'             => $PRODUCT_ID,
                  //'post_author'    => get_current_user_id(), 
                  'post_content'   => $novy_produkt_popis, 
                  'post_modified'  => date('Y-m-d H:i:s'),
                  'post_status'    => ($novy_produkt_viditelnost == "true") ? 'publish' : 'draft',
                  'post_title'     => $novy_produkt_nazev, 
                  //'post_type'      => 'product'
                ); 

                wp_update_post( $post );


                $wp_upload_dir = wp_upload_dir();

                require_once( ABSPATH . 'wp-admin/includes/image.php' );

                $dir = ABSPATH.'wp-content/plugins/budkutil/js/tmp_img/';
                $mine = array("image/jpeg","image/pjpeg","image/png","image/gif");
                $attachments = array();
                $thumbnail = $poradi_attachs[0];
                $p = 0;

                foreach ($poradi_attachs as $key => $value) {
                    $dir = ABSPATH.'wp-content/plugins/budkutil/js/tmp_img/';
                    $file = $_POST['edit_timestamp']."_".$value;

                    if(!attachment_is_asociated($value, $PRODUCT_ID) AND !attachment_is_asociated($file, $PRODUCT_ID))
                    {
                        $wp_filetype = wp_check_filetype(basename($file), null );

                        rename($dir . $file, $wp_upload_dir['basedir'] . '/' . basename( $dir . $file ));

                        $attachment = array(
                         'guid' => $wp_upload_dir['basedir'] . '/' . basename( $dir . $file ), 
                         'post_mime_type' => $wp_filetype['type'],
                         'post_title' => preg_replace( '/\.[^.]+$/', '', basename( $dir . $file ) ),
                         'post_content' => array_search($file, $poradi_attachs),
                         'post_status' => 'inherit',
                         'menu_order' => $p
                        );

                        $attach_id = wp_insert_attachment( $attachment, $wp_upload_dir['basedir'] . '/' . basename( $dir . $file ), $PRODUCT_ID );

                        if($nahled == "")
                            $nahled = $attach_id;

                        $attach_data = wp_generate_attachment_metadata( $attach_id, $wp_upload_dir['basedir'] . '/' . basename( $dir . $file ) );
                        wp_update_attachment_metadata( $attach_id, $attach_data );
                    }
                    else
                    {
                        $attach_id = pn_get_attachment_id_from_url(ABSPATH.'wp-content/uploads/'.$value);
                        if(empty($attach_id)) $attach_id = pn_get_attachment_id_from_url(ABSPATH.'wp-content/uploads/'.$file);

                        if(!$attach_id) {
                            $post = array(
                              'ID'             => $attach_id,
                              'menu_order'     => $p
                            );
                            wp_update_post( $post );
                        } 
                    }

                    if($p == $main_attach)
                            $nahled = $attach_id;
                       $p++;

                    array_push($attachments, $attach_id);
                }
                update_post_meta($PRODUCT_ID, '_thumbnail_id', $nahled);


                $wpdb->delete( 'wp_term_relationships', array( 'object_id' => $PRODUCT_ID ) );

                $wpdb->insert('wp_term_relationships', 
                        array(  
                            'object_id' => $PRODUCT_ID, 
                            'term_taxonomy_id' => $produkt_cat 
                        )
                    );

                if(!empty($kategorie_frst) AND $produkt_cat != $kategorie_frst)
                $wpdb->insert('wp_term_relationships', 
                        array(  
                            'object_id' => $PRODUCT_ID, 
                            'term_taxonomy_id' => $kategorie_frst 
                        )
                    );

                if(!empty($kategorie_sec) AND $produkt_cat != $kategorie_sec)
                $wpdb->insert('wp_term_relationships', 
                        array(  
                            'object_id' => $PRODUCT_ID, 
                            'term_taxonomy_id' => $kategorie_sec
                        )
                    );



                $wpdb->delete( 'bk_produkty_sady', array( 'produkt_id' => $PRODUCT_ID ) );

                foreach ($sada as $parametr) {
                    
                    $sada = $wpdb->get_var("SELECT parametr_id FROM bk_hodnoty WHERE hodnota_id='".$parametr."'");
                    
                    $wpdb->insert('bk_produkty_sady', 
                        array( 
                            'produkt_id' => $PRODUCT_ID, 
                            'sada_id' => $sada, 
                            'parametr_id' => $parametr, 
                            'time' => time()
                        )
                    );
                }

                foreach ($sada as $idecko) {
                    $wpdb->insert('bk_produkty_sady', 
                        array( 
                            'produkt_id' => $PRODUCT_ID, 
                            'parametr_id' => $idecko, 
                            'time' => time()
                        )
                    );
                }

                update_post_meta($PRODUCT_ID, '_product_image_gallery', implode(',', $attachments));
                update_post_meta($PRODUCT_ID, '_regular_price', $novy_produkt_cena);
                update_post_meta($PRODUCT_ID, '_price', $novy_produkt_cena);
                update_post_meta($PRODUCT_ID, '_stock', $novy_produkt_ks);
                wp_set_object_terms($PRODUCT_ID, $tagy, 'product_tag', false);
                update_post_meta($PRODUCT_ID, '_manage_stock', 'yes');
                if($novy_produkt_ks > 0)
                    update_post_meta($PRODUCT_ID, '_stock_status', 'instock');

                //wp_set_post_terms( $PRODUCT_ID, $_POST['produkt_cat']);

                $pridan = false;
            }
            else
            {
                $post = array(
                  'post_author'    => get_current_user_id(), 
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
                $p = 0;
                foreach ($poradi_attachs as $key => $value) {
                    $dir = ABSPATH.'wp-content/plugins/budkutil/js/tmp_img/';
                    $file = $_POST['edit_timestamp']."_".$value;

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

                    if($nahled == "")
                        $nahled = $attach_id;

                    if($p == $main_attach)
                        $nahled = $attach_id;

                    $p++;

                    $attach_data = wp_generate_attachment_metadata( $attach_id, $wp_upload_dir['basedir'] . '/' . basename( $dir . $file ) );
                    wp_update_attachment_metadata( $attach_id, $attach_data );

                    array_push($attachments, $attach_id);
                }


                add_post_meta($last_id, '_thumbnail_id', $nahled);

                /*$dir = ABSPATH.'wp-content/plugins/budkutil/js/tmp_img/';
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
                }   */

                //set_tmbn($last_id, $nahled);
                //wp_set_object_terms( $last_id, array((int)$product_cat), 'product_cat' );
                $wpdb->insert('wp_term_relationships', 
                        array(  
                            'object_id' => $last_id, 
                            'term_taxonomy_id' => $produkt_cat 
                        )
                    );

                if(!empty($kategorie_frst) AND $produkt_cat != $kategorie_frst)
                $wpdb->insert('wp_term_relationships', 
                        array(  
                            'object_id' => $last_id, 
                            'term_taxonomy_id' => $kategorie_frst 
                        )
                    );

                if(!empty($kategorie_sec) AND $produkt_cat != $kategorie_sec)
                $wpdb->insert('wp_term_relationships', 
                        array(  
                            'object_id' => $last_id, 
                            'term_taxonomy_id' => $kategorie_sec
                        )
                    );

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

                foreach ($sada as $idecko) {
                    $wpdb->insert('bk_produkty_sady', 
                        array( 
                            'produkt_id' => $last_id, 
                            'parametr_id' => $idecko, 
                            'time' => time()
                        )
                    );
                }

                add_post_meta($last_id, '_product_image_gallery', implode(',', $attachments));
                add_post_meta($last_id, '_regular_price', $novy_produkt_cena);
                add_post_meta($last_id, '_price', $novy_produkt_cena);
                add_post_meta($last_id, '_stock', $novy_produkt_ks);
                wp_set_object_terms($last_id, $tagy, 'product_tag');
                add_post_meta($last_id, '_manage_stock', 'yes');
                if($novy_produkt_ks > 0)
                    add_post_meta($last_id, '_stock_status', 'instock');

                wp_set_post_terms( $last_id, $_POST['produkt_cat']);
                
                $pridan = true;
                //add error report ##
            }
            
        }
        else
        {
            $report = array("Zamítnuto:");
            if(empty($produkt_cat))
                array_push($report, "Vyberte prosím kategorii zboží."); 
            if(empty($_POST['poradi_attachs']))
                array_push($report, "Nahrajte prosím alespoň jeden obrázek Vašeho zboží"); 
            if(empty($novy_produkt_nazev))
                array_push($report, "Zadejte prosím název zboží."); 
            if(empty($novy_produkt_popis)) 
                array_push($report, "Zadejte prosím popis zboží."); 
            if(empty($novy_produkt_cena))
                array_push($report,  "Zadejte prosím cenu zboží.");
            if(empty($novy_produkt_ks)) 
                array_push($report,  "Zadejte prosím počet kusů."); 
            if($_POST['edit_timestamp'] > (time()-15))
                array_push($report,  "Váš požadavek byl vyhodnocen jako SPAM."); 

            foreach ($report as $value) {
                $error_msgs .= "<li>$value</li>";
            }
            $report = "<div class=\"warning_report\"><ul>{$error_msgs}</ul></div>";
        }
    }

    
    if($pridan == true)
    {
        include ABSPATH."wp-content/plugins/budkutil/frontend/new_product_added.tpl";
    }
    else
    {
        $template = get_template_bk('frontend', 'new_product_form');

        if($PRODUCT_ID > 0)
        {
            $produkt = get_post( $PRODUCT_ID);
            $tagy    = array();

            $product_terms = wp_get_object_terms($PRODUCT_ID, 'product_cat', array('orderby' => 'term_order', 'order' => 'ASC'));
            if(!empty($product_terms))
              if(!is_wp_error( $product_terms ))
                foreach($product_terms as $term)
                  $kategorie[] = $term->term_taxonomy_id; 

            $product_terms = wp_get_object_terms($PRODUCT_ID, 'product_tag', array('orderby' => 'term_order', 'order' => 'ASC'));
            if(!empty($product_terms))
              if(!is_wp_error( $product_terms ))
                foreach($product_terms as $term)
                  array_push($tagy, $term->name); 

            $cena = get_post_meta( $PRODUCT_ID, '_price' )[0];
            if(empty($cena))
                $cena = get_post_meta( $PRODUCT_ID, '_regular_price' )[0];

            $status = get_post_status( $PRODUCT_ID );

            $ks = get_post_meta( $PRODUCT_ID, '_stock' )[0];

            $thumb_id = get_post_thumbnail_id( $PRODUCT_ID );
            $nahled = wp_get_attachment_image_src( $thumb_id,'thumbnail' )[0];

            $komentaru = get_comments_number( $PRODUCT_ID );

            $parametry = $wpdb->get_results("SELECT * FROM bk_produkty_sady WHERE produkt_id='{$PRODUCT_ID}'");
            foreach ($parametry as $parametr) {
                $vybrane_parametry[] = $parametr->parametr_id;
            }

            $parametry = implode(',', $vybrane_parametry);

            $images =& get_children( array (
                'post_parent' => $PRODUCT_ID,
                'post_type' => 'attachment',
                'post_mime_type' => 'image'
            ));

            foreach ( $images as $attachment_id => $attachment ) 
                $nahrane_obrazky[] = basename(wp_get_attachment_image_src( $attachment_id, 'thumbnail' )[0]);        
    
            //$kategorie_end                  = get_term(end($kategorie), 'product_cat' );
            //$kategorie_end_parent           = $kategorie_end->parent;
            //$kategorie_kategorie1           = get_term($kategorie_end_parent, 'product_cat' );
            //$kategorie_kategorie1_parent    = $kategorie_kategorie1->parent;

            $in_novy_produkt_nazev         = get_the_title($PRODUCT_ID);
            $in_novy_produkt_popis         = $produkt->post_content;
            $in_novy_produkt_cena          = $cena;
            $in_novy_produkt_ks            = (!empty($ks)) ? $ks : "0";
            $in_novy_produkt_viditelnost   = ($status == "publish") ? "true" : "false";
            $in_vybrana_kategorie          = end($kategorie);
            $in_kategorie_frst             = (!empty($kategorie[0])) ? $kategorie[0] : "";
            $in_kategorie_sec              = (!empty($kategorie[1])) ? $kategorie[1] : "";
            $in_poradi_attachs             = implode('|', $nahrane_obrazky);
            $in_main_attach                = array_search(basename($nahled),$nahrane_obrazky);
            $in_vybrane_parametry          = $parametry;
            $in_sada                       = $parametry;
            $in_edit_timestamp             = time();
            $in_tagy                       = implode(',', $tagy);

            $cesta_obr = "uploads/";
        }
        else
        {
            $in_novy_produkt_nazev         = $_POST['novy_produkt_nazev'];
            $in_novy_produkt_popis         = $_POST['novy_produkt_popis'];
            $in_novy_produkt_cena          = $_POST['novy_produkt_cena'];
            $in_novy_produkt_ks            = ($_POST['novy_produkt_ks']) ? $_POST['novy_produkt_ks'] : "1";
            $in_novy_produkt_viditelnost   = $_POST['novy_produkt_viditelnost'];
            $in_vybrana_kategorie          = $_POST['vybrana_kategorie'];
            $in_kategorie_frst             = $_POST['kategorie_frst'];
            $in_kategorie_sec              = $_POST['kategorie_sec'];
            $in_poradi_attachs             = $_POST['poradi_attachs'];
            $in_main_attach                = $_POST['main_attach'];
            $in_vybrane_parametry          = $_POST['vybrane_parametry'];
            $in_sada                       = $_POST['sada'];
            $in_edit_timestamp             = $_POST['edit_timestamp'];
            $in_tagy                       = $_POST['tagy'];

            $cesta_obr = "plugins/budkutil/js/tmp_img/";
        }

        ob_start();
            $nastaveni = array(
                'tinymce' => array(
                    'theme_advanced_buttons1' => 'bold,italic,underline,bullist,numlist,outdent,indent,fontsizeselect,undo,redo,forecolor,link,unlink',
                    'theme_advanced_buttons2' => '',
                    'theme_advanced_buttons3' => ''
                ),
                'textarea_name' => 'novy_produkt_popis',
                'media_buttons' => false,
                'quicktags' => false,
            );
              /*  'tinymce' => array(
                'theme_advanced_buttons1' => 'formatselect,|,bold,italic,underline,|,' .
                    'bullist,blockquote,|,justifyleft,justifycenter' .
                    ',justifyright,justifyfull,|,link,unlink,|' .
                    ',spellchecker,wp_fullscreen,wp_adv'
            )*/

            wp_editor($in_novy_produkt_popis,"novy_produkt_popis", $nastaveni);
        $editor = ob_get_clean();
       
        $zaznamy = $wpdb->get_results("SELECT * FROM wp_term_taxonomy, wp_terms WHERE wp_term_taxonomy.taxonomy='product_cat'  AND wp_term_taxonomy.term_id=wp_terms.term_id ORDER BY wp_terms.name");
        $tree = category_tree($zaznamy);
        $array = json_decode(json_encode($tree), true);
        ob_start();
            echo '<ul id="browser" class="filetree treeview-famfamfam">';
            seznam($array);
            echo "</ul>";
        $tree = ob_get_clean();

        $user_id = get_current_user_id();
        $provize = $wpdb->get_var("SELECT provize_vyse FROM bk_provize WHERE user_id='$user_id'");
        if($provize == 0)
            $provize = $wpdb->get_var("SELECT option_value FROM $wpdb->options WHERE option_name='provize'");

        $sady = $wpdb->get_results("SELECT * FROM bk_parametry ORDER BY parametr_nazev");
        foreach ($sady as $sada)
            $sady_options .= '<option value="'.$sada->parametr_id.'">'.$sada->parametr_nazev.'</option>';

        $apendix = '<script type="text/x-handlebars-template" id="taxonomy_terms">
        
            <div class="miller--terms--container">
                
                {{#if parent}}
                    <div class="miller--terms--selection">                  
                        {{#each parent}} {{#if @index}} &raquo; {{/if}} <span class="crumb" data-depth="{{depth}}">{{name}}</span>{{/each}}
                    </div>
                {{/if}}

            <ul class="terms">
                {{#each taxonomies}}
                    <li class="term {{#if childrenCount}}has-children{{/if}}" data-id="{{id}}">
                        <a id="{{idecko}}">
                          <span class="title">{{label}}</span> 
                          <em class="icon icon-arrow"></em>
                        {{#if description}}<span class="description">{{description}}</span>{{/if}}
                        </a>
                    </li>
                {{/each}}
            </ul>
            
            </div>  
            
        </script>';

        if(empty($PRODUCT_ID))
        {
            $apendix .= '<script>
            jQuery(window).unload(function(){
                if(jQuery(\'input[name=submited]\').val() != "submited")
                {
                    jQuery.ajax({
                        type: \'POST\',
                        url: \'/wp-content/plugins/budkutil/js/do_kose.php\',
                        async:false,
                        data: {time: '.(($in_edit_timestamp) ? $in_edit_timestamp : time()).'}
                    });
                }
            });
            </script>';
        }

        if($in_tagy)
        {
            $data = array();
            $tagy = explode(',', $in_tagy);
            foreach ($tagy as $tag) {
                $data[] = '{id: "'.$tag.'", text: "'.$tag.'"}';
            }

            $apendix .= '<script>jQuery( function() {jQuery("#tagy").select2("data", ['.implode(',', $data).']);});</script>';
        }

        $template = str_replace('{strom}', $tree, $template);
        $template = str_replace('{sady_parametru}', $sady_options, $template);      
        $template = str_replace('{editor}', $editor, $template);       
        $template = str_replace('{provize}', $provize, $template);  
        $template = str_replace('{apendix}', $apendix, $template); 
        $template = str_replace('{btn-label}', (($PRODUCT_ID > 0) ? "Upravit produkt" : "Vytvořit produkt"), $template); 



        $template = str_replace('{POST-novy_produkt_nazev}', (empty($in_novy_produkt_nazev)) ? 'Jak se bude tvůj produkt jmenovat?' : $in_novy_produkt_nazev, $template); 
        $template = str_replace('{POST-novy_produkt_cena}', $in_novy_produkt_cena, $template);
        $template = str_replace('{POST-novy_produkt_ks}', $in_novy_produkt_ks, $template); 

        if($in_novy_produkt_viditelnost == "true" OR !isset($in_novy_produkt_viditelnost)) 
            $viditelnost = 'checked="checked"'; 
        else 
            $viditelnost = '';
        $template = str_replace('{POST-novy_produkt_viditelnost}', $viditelnost, $template); 

        $template = str_replace('{POST-vybrana_kategorie}', $in_vybrana_kategorie, $template);         
        $template = str_replace('{POST-kategorie_frst}', $in_kategorie_frst, $template);  
        $template = str_replace('{POST-kategorie_sec}', $in_kategorie_sec, $template);     
        $template = str_replace('{POST-poradi_attachs}', $in_poradi_attachs, $template);  
        $template = str_replace('{POST-main_attach}', $in_main_attach, $template);
        $template = str_replace('{POST-vybrane_parametry}', ($in_vybrane_parametry) ? $in_vybrane_parametry : implode(',', $in_sada), $template);  


        $poradi_attachs = explode('|', $in_poradi_attachs);
        $main_attach    = $in_main_attach;
        $dir            = ABSPATH.'wp-content/'.$cesta_obr;
        $mine           = array("image/jpeg","image/pjpeg","image/png","image/gif");
        $attachments    = array();
        $thumbnail      = $in_poradi_attachs[0];
        $p              = 0;

        foreach ($poradi_attachs as $key => $value) {
            $dir    = ABSPATH.'wp-content/'.$cesta_obr;

            if($PRODUCT_ID > 0)
            {
                $file   = $value;
                preg_match('/.+\/([0-9]{10})_.+/', $dir.$file, $chunks);
                
                $in_edit_timestamp = $chunks[1];
            }
            else
                $file   = $in_edit_timestamp."_".$value;

            $value  = str_replace($in_edit_timestamp."_", '', $value);
            
            if(file_exists($dir.$file))
            {
                $class = "";
                if($main_attach == $key || (empty($main_attach) AND $key == 0))
                    $class = "main"; 
        
                $obrazky .= '<li><div class="preview">'.
                            '<span class="imageHolder">'.
                                '<img class="dad_nahled" src="/wp-content/'.$cesta_obr.$file.'" />'.
                                '<a class="upedimg" title="'.$value.'">'.
                                '<span class="uploaded '.$class.'">'.
                                    '<div class="toolbar">'.
                                        '<i class="icon-trash dad_close"></i>'.
                                        '<i class="icon-star dad_star"></i>'.
                                      '</div>'.
                                  '</a>'.
                                '<img src="/wp-content/plugins/budkutil/js/img-up/assets/img/done.png" class="dad_status" style="display: none" alt="" /></span>'.
                            '</span>'.
                        '</div></li>'; 
            }
        }

        $template = str_replace('{time}', ($in_edit_timestamp) ? $in_edit_timestamp : time(), $template);      

        $template = str_replace('{POST-obrazky}', $obrazky, $template);  
    }

    if(is_user_logged_in())
        return $report.$template;
    else
        return must_log_in();
}
add_shortcode( 'pridat_produkt', 'pridat_produkt_uzivatel' );
add_shortcode( 'upravit_produkt', 'pridat_produkt_uzivatel' );

function seznam_produktu_majitel( $atts ) {
    global $wpdb;
    global $current_user;
    global $paged;

    $curpage = $paged ? $paged : 1;

    if ( is_user_logged_in() ) {
        
        get_currentuserinfo();

        $args = array(
            'post_type'         => 'product',
            'order'             => 'DESC',
            'posts_per_page'    => '9',
            'author'            => get_current_user_id(),
            'paged'             => $paged
            
        );
        query_posts( $args );
        $template = get_template_bk('frontend', 'product_list_owner');

        if ( have_posts() ) : while ( have_posts() ) : the_post();

            $post_id = get_the_ID();
            $kategorie = array();
            $post_output = $template;

            $product_terms = wp_get_object_terms($post_id, 'product_cat', array('orderby' => 'term_order', 'order' => 'ASC'));
            if(!empty($product_terms))
              if(!is_wp_error( $product_terms ))
                foreach($product_terms as $term)
                  $kategorie[] = '<a href="'.get_term_link($term->slug, 'product_cat').'">'.$term->name.'</a>'; 

            $cena = get_post_meta( $post_id, '_price' )[0];
            if(empty($cena))
                $cena = get_post_meta( $post_id, '_regular_price' )[0];
            if(empty($cena))
                $cena = "---";

            $status = get_post_status( $post_id );
            if($status == "publish")
                $tlacitko_viditelnost = array( 'text' => 'Stáhnout zboží');
            else
                $tlacitko_viditelnost = array( 'text' => 'Publikovat');

            $thumb_id = get_post_thumbnail_id( $post_id );
            $nahled = wp_get_attachment_image_src( $thumb_id,'thumbnail' );
        
            $nazev = the_title('','',false);
            $komentaru = get_comments_number( $post_id );

            
            $post_output = str_replace('{nahled-url}', $nahled[0], $post_output); 
            $post_output = str_replace('{nazev}', $nazev, $post_output); 
            $post_output = str_replace('{kategorie}', implode(' <span class="separator">></span> ', $kategorie), $post_output); 
            $post_output = str_replace('{cena}', $cena." Kč", $post_output); 
            $post_output = str_replace('{tlacitko-viditelnost-url}', $tlacitko_viditelnost[url], $post_output); 
            $post_output = str_replace('{tlacitko-viditelnost-text}', $tlacitko_viditelnost[text], $post_output); 
            $post_output = str_replace('{komentaru}', $komentaru, $post_output);

            $post_output = str_replace('{url-edit}', '/upravit-vyrobek/'.$post_id.'/', $post_output); 


            echo $post_output;
            endwhile; 
        else:
            echo "<div class=\"prazdno\">Dosud žádné zboží</div>";
        endif;

        posts_nav_link();

        wp_reset_query();

    } else {
        echo must_log_in();
    }
}
add_shortcode( 'seznam_produktu_majitel', 'seznam_produktu_majitel' );


function seznam_produktu_ostatni( $atts ) {
    global $wpdb;
    global $current_user;
    global $paged;
    global $wp_query;

    $USER_ID = $wp_query->query_vars['page'];

    $curpage = $paged ? $paged : 1;

    if ( is_user_logged_in() ) {

        $args = array(
            'post_type'         => 'product',
            'order'             => 'DESC',
            'posts_per_page'    => '9',
            'author'            => (empty($USER_ID)) ? get_current_user_id() : $USER_ID,
            'paged'             => $paged
            
        );
        query_posts( $args );
        $template = get_template_bk('frontend', 'product_list_others');

        if ( have_posts() ) : while ( have_posts() ) : the_post();

            $post_id = get_the_ID();
            $kategorie = array();
            $post_output = $template;

            $product_terms = wp_get_object_terms($post_id, 'product_cat', array('orderby' => 'term_order', 'order' => 'ASC'));
            if(!empty($product_terms))
              if(!is_wp_error( $product_terms ))
                foreach($product_terms as $term)
                  $kategorie[] = '<a href="'.get_term_link($term->slug, 'product_cat').'">'.$term->name.'</a>'; 

            $cena = get_post_meta( $post_id, '_price' )[0];
            if(empty($cena))
                $cena = get_post_meta( $post_id, '_regular_price' )[0];
            if(empty($cena))
                $cena = "---";

            $thumb_id = get_post_thumbnail_id( $post_id );
            $nahled = wp_get_attachment_image_src( $thumb_id,'thumbnail' );
        
            $nazev = the_title('','',false);
            $komentaru = get_comments_number( $post_id );

            
            $post_output = str_replace('{nahled-url}', $nahled[0], $post_output); 
            $post_output = str_replace('{nazev}', $nazev, $post_output); 
            $post_output = str_replace('{kategorie}', implode(' <span class="separator">></span> ', $kategorie), $post_output); 
            $post_output = str_replace('{cena}', $cena." Kč", $post_output); 
            $post_output = str_replace('{komentaru}', $komentaru, $post_output);
            $post_output = str_replace('{url-view}', get_permalink( $post_id ), $post_output); 


            echo $post_output;
            endwhile; 
        else:
            echo "<div class=\"prazdno\">Dosud žádné zboží</div>";
        endif;

        posts_nav_link();

        wp_reset_query();

    } else {
        echo must_log_in();
    }
}
add_shortcode( 'seznam_produktu_ostatni', 'seznam_produktu_ostatni' );


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