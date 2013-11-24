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
Version: 0.2
Author URI: http://webartmedia.cz

*/
include ABSPATH.'wp-content/plugins/budkutil/admin/check_db.php';

include ABSPATH.'wp-content/plugins/budkutil/admin/extensions.php';

include ABSPATH.'wp-content/plugins/budkutil/admin/tables.php';

include ABSPATH.'wp-content/plugins/budkutil/admin/general_functions.php';



/* ROZHRANí */
function parametry_page() {
    global $wpdb;

    echo '<div class="wrap">';

    if($_GET['delete'])
    {
            if($wpdb->delete('bk_hodnoty', array( 'hodnota_id' => $_GET['delete'])))
                echo '<div class="updated"><p><strong>Záznam byl smazán.</strong></p></div>';
            else
                echo '<div class="error"><p><strong>Záznam se nepodařilo smazat.</strong></p></div>';
    }

    if($_POST['ulozit_parametr'])
    {
        $error = 0;
        if(!$wpdb->insert('bk_hodnoty', 
            array( 
                'hodnota_nazev' => $_POST['nazev'], 
                'parametr_id' => $_POST['parametr'], 
                'hodnota_img' => $_POST['img'], 
                'hodnota_time' => time(),
                'hodnota_ip' => getRealIpAddr()
            )
        )) ++$error;
        
        if($error == 0)
            echo '<div class="updated"><p><strong>Nový parametr úspěšně uložen.</strong></p></div>';
        else
            echo '<div class="error"><p><strong>Nový parametr se nepodařilo uložit.</strong></p></div>';

    }
    elseif($_POST['upravit_parametr'])
    {
            if($wpdb->update('bk_hodnoty', 
                array( 
                    'hodnota_nazev' => $_POST['nazev'], 
                    'parametr_id' => $_POST['parametr'], 
                    'hodnota_img' => $_POST['img']
                ),
                array( 'hodnota_id' => $_GET['pid'])
            ))
                echo '<div class="updated"><p><strong>Úpravy byly úspěšně uloženy.</strong></p></div>';
            else
                echo '<div class="error"><p><strong>Úpravy se nepodařilo uložit.</strong></p></div>';
    }

    if($_GET['action'] == "add_parametr")
    {
      

               
    }
    elseif($_GET['action'] == "edit")
    {
        

            
    }
    else
    {
        echo '
        <h2>
            Jednotlivé parametry
            <a class="add-new-h2" href="admin.php?page='.$_REQUEST['page'].'&action=add_sada">Nový parametr</a>
        </h2>';

        $wp_list_table = new Hodnoty_List_Table();
        $wp_list_table->prepare_items();
        //$wp_list_table->search_box('vyhledat podle ID', 'provize_id');
        $wp_list_table->display();
    }

    echo '</div>';
}

function sady_page() {
    global $wpdb;

    echo '<div class="wrap">';

    if($_GET['delete'])
    {
            if($wpdb->delete('bk_parametry', array( 'parametr_id' => $_GET['delete'])))
                echo '<div class="updated"><p><strong>Záznam byl smazán.</strong></p></div>';
            else
                echo '<div class="error"><p><strong>Záznam se nepodařilo smazat.</strong></p></div>';
    }

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
    elseif($_POST['upravit_sada'])
    {
            if($wpdb->update('bk_parametry', 
                array( 
                    'parametr_nazev' => $_POST['nazev'], 
                    'neaktivni_v' => $_POST['poradi2'] 
                ),
                array( 'parametr_id' => $_GET['sid'])
            ))
                echo '<div class="updated"><p><strong>Úpravy byly úspěšně uloženy.</strong></p></div>';
            else
                echo '<div class="error"><p><strong>Úpravy se nepodařilo uložit.</strong></p></div>';
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
    elseif($_GET['action'] == "edit")
    {
        $parametr = $wpdb->get_row("SELECT * FROM bk_parametry WHERE parametr_id='".$_GET['sid']."'");

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
                                <input type="text" name="nazev" value="'.$parametr->parametr_nazev.'" />
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

                                    $polotovar = explode(',',$parametr->neaktivni_v);
                                    $vyrazeno = array(); 
                                    foreach ($polotovar as $kategorie)
                                    {
                                        $elementy = explode('=', $kategorie);
                                        array_push($vyrazeno, $elementy[0]);
                                    }
                                
                                    $kategorie = $wpdb->get_results("SELECT * FROM $wpdb->terms ORDER BY name");
                                    foreach ($kategorie as $zaznam) 
                                    {
                                        if(!in_array($zaznam->term_id, $vyrazeno))
                                            echo '<li class="ui-state-default" title="'.$zaznam->term_id.'">'.$zaznam->name.'</li>';
                                    }
                                
                                echo '
                                </ul>
                                 
                                <ul id="sortable2" class="dropfalse">';
                                    
                                    foreach ($vyrazeno as $kategorie)
                                    {
                                        if(!empty($kategorie))
                                        {
                                            $zaznam = $wpdb->get_row("SELECT * FROM $wpdb->terms WHERE term_id='".$kategorie."'");
                                            echo '<li class="ui-state-default" title="'.$kategorie.'">'.$zaznam->name.'</li>';    
                                        } 
                                    }
                                
                                echo '
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th valign="top" scope="row"></th>
                            <td>
                                <input type="submit" class="button button-primary" name="upravit_sada" value="Uložit" />
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
