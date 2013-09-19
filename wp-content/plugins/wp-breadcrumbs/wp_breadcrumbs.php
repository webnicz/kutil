<?php
/*
Plugin Name: WP Breadcrumbs
Plugin URI: http://wallgrenconsulting.se
Description: Outputting breadcrumbs when using the function wp_breadcrumbs()
Version: 1.0
Author: Mikael Wallgren
Author URI: http://wallgrenconsulting.se
*/

function wp_breadcrumbs($roottext = null, $separator = '»') {
    global $post;
    if ($roottext == null) {
	$roottext = get_bloginfo('name');
    }
    if(!is_front_page()){
	$breadcrumbs = '';
	$breadcrumbs .= '<li class="separator">'.$separator.'</li><li class="last">' . $post->post_title . '</li>';
	while($post->post_parent != ''){
	    $post = get_post($post->post_parent);
	    $breadcrumbs = '<li class="separator">'.$separator.'</li><li><a href="' . get_permalink($post->ID) . '">' . $post->post_title . '</a></li>'.$breadcrumbs;
	}
    }
    $breadcrumbs = '<li class="first"><a href="' . get_bloginfo('siteurl') . '">' . $roottext . '</a></li>'.$breadcrumbs;
    echo '<ul class="wp-breadcrumbs">' . $breadcrumbs . '</ul>';
}
?>