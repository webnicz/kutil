<?php

/**
 * BuddyPress - Users Header
 *
 * @package BuddyPress
 * @subpackage bp-legacy
 
 
 
 BOČNÍ PANEL PRO UŽIVATELE
 
 
 */

?>

<?php do_action( 'bp_before_member_header' ); ?>

<div id="item-header-avatar">
	<a href="<?php bp_displayed_user_link(); ?>">

		<?php 
		
			bp_displayed_user_avatar('type=full&width=300&height=300'); 
		?>

	</a>
</div><!-- #item-header-avatar -->

<div id="item-header-content">

	<h2 class="user-nicename"><?php bp_displayed_user_fullname(); ?></h2>
	<h4 class="userName"><i class="icon-user"></i> <?php bp_displayed_user_username(); ?></h4>
	<span class="activity"><i class="icon-time"></i> <?php bp_last_activity( bp_displayed_user_id() ); ?></span>

	<?php do_action( 'bp_before_member_header_meta' ); ?>

	<div id="item-meta">

		<?php if ( bp_is_active( 'activity' ) ) : ?>
	
			<div id="latest-update">

				<?php 
					bp_activity_latest_update( bp_displayed_user_id() ); 	
				?>


			</div>

		<?php endif; ?>

		<div id="item-buttons">

			<?php do_action( 'bp_member_header_actions' ); ?>

		</div><!-- #item-buttons -->

		<?php
		/***
		 * If you'd like to show specific profile fields here use:
		 * bp_member_profile_data( 'field=About Me' ); -- Pass the name of the field
		 */
		 do_action( 'bp_profile_header_meta' );

		 ?>

	</div><!-- #item-meta -->

</div><!-- #item-header-content -->

<?php do_action( 'bp_after_member_header' ); ?>
