<?php get_header(); ?>

<div id="buddypress">
	
	<!-- #sidebar -->
	<div id="secondary">
	
		<aside>
			<div id="item-header" role="complementary">
					<?php bp_get_template_part( 'members/single/member-header' ) ?>
			</div><!-- #item-header -->
		</aside>
		
		<aside>
			<h3>Můj účet</h3>
			<div id="item-nav">
				<div class="item-list-tabs no-ajax" id="object-nav" role="navigation">
					<ul class="nav nav-pills nav-stacked">
						<?php bp_get_displayed_user_nav(); ?>
						<?php do_action( 'bp_member_options_nav' ); ?>
					</ul>
				</div>
			</div><!-- #item-nav -->
		</aside>
		
	</div><!-- #sidebar end -->


	

	<!-- #content -->
	<div id="primary" class="site-content" role="main">
		<?php do_action( 'bp_before_member_plugin_template' ); ?>

		<?php if ( ! bp_is_current_component_core() ) : ?>

		<div class="item-list-tabs no-ajax" id="subnav">
			<ul>
				<?php bp_get_options_nav(); ?>

				<?php do_action( 'bp_member_plugin_options_nav' ); ?>
			</ul>
		</div><!-- .item-list-tabs -->

		<?php endif; ?>

		<h3><?php do_action( 'bp_template_title' ); ?></h3>

		<?php do_action( 'bp_template_content' ); ?>

		<?php do_action( 'bp_after_member_plugin_template' ); ?>
		
	</div><!-- #content end -->

</div><!-- #buddypress -->


<?php get_footer(); ?>