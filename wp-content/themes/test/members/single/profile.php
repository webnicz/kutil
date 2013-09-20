<?php

/**
 * BuddyPress - Users Profile
 *
 * @package BuddyPress
 * @subpackage bp-legacy
 */

?>

<h2 class="entry-title"><i class="icon-user"></i> Profil</h2>

<?php if ( bp_is_my_profile() ) : ?>
	<div class="item-list-tabs no-ajax" id="subnav" role="navigation">
		<ul class="nav nav-pills">

			<?php bp_get_options_nav(); ?>

		</ul>
	</div><!-- .item-list-tabs -->

<?php endif; ?>

<div class="entry-content">

	<?php do_action( 'template_notices' ); ?>

	<?php do_action( 'bp_before_profile_content' ); ?>

		<div class="profile" role="main">
		
		<?php switch ( bp_current_action() ) :
		
			// Edit
			case 'edit'   :
				bp_get_template_part( 'members/single/profile/edit' );
				break;
		
			// Change Avatar
			case 'change-avatar' :
				bp_get_template_part( 'members/single/profile/change-avatar' );
				break;
		
			// Compose
			case 'public' :
		
				// Display XProfile
				if ( bp_is_active( 'xprofile' ) )
					bp_get_template_part( 'members/single/profile/profile-loop' );
		
				// Display WordPress profile (fallback)
				else
					bp_get_template_part( 'members/single/profile/profile-wp' );
		
				break;
		
			// Any other
			default :
				bp_get_template_part( 'members/single/plugins' );
				break;
		endswitch; ?>
		</div><!-- .profile -->

	<?php do_action( 'bp_after_profile_content' ); ?>

</div>