<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'c1budkutilcz');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', 'localhost:8889');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '1PC(jK3F_c/Rb-Z+nJ(mqFPC^Xng-8jZ:c(`HJE6C-Pkc:V5u8QY<;37Cj1+5f2y');
define('SECURE_AUTH_KEY',  '&2i<6HcDgJec1&9|8!Q{$-V@3-*&#|cx(J>uj]-!uI+LwH^Kx3:zLRmPY4+OT|<w');
define('LOGGED_IN_KEY',    ']M04E~P#DY,-5soUSJKv{oH9j!~F6fDLJC.=ObUhC<sl_Hj2njH8Q{Q|3!c;l5Kq');
define('NONCE_KEY',        'C=>8S$GZ|+7bD%Do,%<?IuNi9Bx[x;*c6/`_o6t<K_{#vv:|4K[L(h,lbs1!m-9C');
define('AUTH_SALT',        'o1gWTu6}@xIr|{oB;r&(!]/FMk>7m7-?) 4+|QTjIS__zQ)$l$(~ m{zZvZj?^o.');
define('SECURE_AUTH_SALT', '9U?k`lr:&+{UP :s+W Fw?1w|s/u&A^E9xsAU.R@ATl<#1}-#Pav;gOTr![Fvo2(');
define('LOGGED_IN_SALT',   'T|zp2A1^t*%IdqGg6mk.Y} PwVpGXY<$_Y}bE51G>Mn>#-]ed-b&CR|)vIb4G#(K');
define('NONCE_SALT',       '+^;wK` L$ZAov-zgoU,?p$E,]/9(78OHG0Y2v?S)g2;wt#$ilz`x0N,QhObSI#_n');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', 'cs_CZ');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
