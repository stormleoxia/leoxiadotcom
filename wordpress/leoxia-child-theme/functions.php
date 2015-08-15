<?php
function register_my_widget_theme() {
	if (function_exists ( 'register_sidebar' )) {

		// sidebar for pages
		$sidebarservices = array (
				'id' => 'sidebar-services', // identifier
				'name' => 'Sidebar Services', // Dashboard name
				'description' => 'Sidebar for services.', // Optional description
				'before_widget' => '<li id="%1$s" class="widget %2$s">', // content class name in css
				'after_widget' => '</li>',
				'before_title' => '<h2 class="widgettitle">', // title class name
				'after_title' => '</h2>' 
		);
		
		// sidebar for post
		$sidebarwiki = array (
				'id' => 'sidebar-wiki', // identifier
				'name' => 'Sidebar Wiki', // Dashboard name
				'description' => 'Sidebar for the wiki pages.', // Optional description
				'before_widget' => '<li id="%1$s" class="widget %2$s">', // content class name in css
				'after_widget' => '</li>',
				'before_title' => '<h2 class="widgettitle">', // title class name
				'after_title' => '</h2>'
		);
		
		register_sidebar ($sidebarwiki);
		register_sidebar ($sidebarservices);
	}
}


add_action ( 'init', 'register_my_widget_theme' );


//* Do NOT include the opening php tag shown above. Copy the code shown below into functions.php
/**
 * Remove emoji support.
 */
function grd_remove_emoji() {
	remove_action( 'wp_head', 'print_emoji_detection_script', 7 );
	remove_action( 'admin_print_scripts', 'print_emoji_detection_script' );
	remove_action( 'admin_print_styles', 'print_emoji_styles' );
	remove_action( 'wp_print_styles', 'print_emoji_styles' );
	remove_filter( 'the_content_feed', 'wp_staticize_emoji' );
	remove_filter( 'comment_text_rss', 'wp_staticize_emoji' );
	remove_filter( 'wp_mail', 'wp_staticize_emoji_for_email' );
	// Remove from TinyMCE
	add_filter( 'tiny_mce_plugins', 'grd_remove_tinymce_emoji' );
}
add_action( 'init', 'grd_remove_emoji' );
/**
 * Filter out the tinymce emoji plugin.
 */
function grd_remove_tinymce_emoji( $plugins ) {
	if ( ! is_array( $plugins ) ) {
		return array();
	}
	return array_diff( $plugins, array( 'wpemoji' ) );
}

/*
** Remove Script versions
*/
function ewp_remove_script_version( $src ){
	return remove_query_arg( 'ver', $src );
}
add_filter( 'script_loader_src', 'ewp_remove_script_version', 15, 1 );
add_filter( 'style_loader_src', 'ewp_remove_script_version', 15, 1 );


@ini_set( 'upload_max_size' , '2M' );
@ini_set( 'post_max_size', '16M');

?>