<?php
/**
 * The Header for our theme.
 *
 * Displays all of the <head> section and everything up till <div id="main">
 *
 * @package WordPress
 * @subpackage Twenty_Twelve
 * @since Twenty Twelve 1.0
 */
?><!DOCTYPE html>
<!--[if IE 7]>
<html class="ie ie7" <?php language_attributes(); ?>>
<![endif]-->
<!--[if IE 8]>
<html class="ie ie8" <?php language_attributes(); ?>>
<![endif]-->
<!--[if !(IE 7) | !(IE 8)  ]><!-->
<html <?php language_attributes(); ?>>
<!--<![endif]-->
<head>
<meta charset="<?php bloginfo( 'charset' ); ?>" />
<meta name="viewport" content="width=device-width" />
<title><?php wp_title( '|', true, 'right' ); ?></title>
<link rel="profile" href="http://gmpg.org/xfn/11" />
<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>" />
<?php // Loads HTML5 JavaScript file to add support for HTML5 elements in older IE versions. ?>
<!--[if lt IE 9]>
<script src="<?php echo get_template_directory_uri(); ?>/js/html5.js" type="text/javascript"></script>
<![endif]-->
<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>

<div id="page" class="hfeed site">

	<header id="masthead" class="site-header" role="banner">

	
		<hgroup>
			<h1 class="site-title">
				<i class="icon-group"></i>
				<a href="<?php echo esc_url( home_url( '/' ) ); ?>" title="<?php echo esc_attr( get_bloginfo( 'name', 'display' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a>
			</h1>
		</hgroup>

		<nav id="site-navigation" class="main-navigation" role="navigation">
			<?php wp_nav_menu( array( 'theme_location' => 'primary', 'menu_class' => 'nav-menu' ) ); ?>
		</nav><!-- #site-navigation -->
		
		
		<div class="loginRegister">
			<a href="#" class="login btn"><i class="icon-lock"></i> Přihlásit se</a>
			<a href="/registrace/" class="register btn btn-success"><i class="icon-group"></i> Registrace</a>
		</div>
		
		<div class="signIn">
			<div class="btn btn-link login">Přihlásit se
				<div class="loginForm">				
					 <?php $args = array(
					        'echo' => true,
					        'redirect' => site_url( $_SERVER['REQUEST_URI'] ), 
					        'form_id' => 'loginform',
					        'label_username' => __( 'Username' ),
					        'label_password' => __( 'Password' ),
					        'label_remember' => __( 'Remember Me' ),
					        'label_log_in' => __( 'Log In' ),
					        'id_username' => 'user_login',
					        'id_password' => 'user_pass',
					        'id_remember' => 'rememberme',
					        'id_submit' => 'wp-submit',
					        'remember' => true,
					        'value_username' => NULL,
					        'value_remember' => false ); ?>        
					<?php wp_login_form( $args ); ?> 					        
				</div>
			</div>
		</div>

	</header><!-- #masthead -->

	<div class="userAcc">
	
		<?php if ( is_user_logged_in() ) { ?> 
			<div class="user">
				<a href="<?php echo bp_loggedin_user_domain(); ?>" class="userAcclink"><?php bp_loggedin_user_avatar(); ?><strong><? echo bp_loggedin_user_fullname(); ?></strong>
					<? if(bp_core_get_notifications_for_user(bp_loggedin_user_id())){ ?>
						<span class="activityCount"><? echo count(bp_core_get_notifications_for_user(bp_loggedin_user_id())); ?></span>
					<? } ?>
				</a>		
				<ul>
					<?php bp_get_loggedin_user_nav(); ?>
				</ul>
				
			</div>
		<?php }?>
		
	</div>


	<div id="main" class="wrapper">