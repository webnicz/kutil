<?
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
?>