// Create closure.
(function( jQuery ) {
	var opts = times = start = null;
	// Plugin definition.
	jQuery.fn.pageleave = function( options ) {
		opts = jQuery.extend( {}, jQuery.fn.pageleave.defaultOptions, options );
		times = opts.times;
		start = new Date().getTime();
		init();
	};

	function init() {
		jQuery(opts.container).on('mousemove.pageleave', function(evt) {
			var elapsed = new Date().getTime() - start;
			if ((evt.clientY <= opts.limitY) && (evt.clientX <= opts.limitX) && (elapsed >= opts.timeTillActive)) {
				if (times > 0) times--;
			    if (typeof opts.callback == 'function') opts.callback.call(this);
			    else triggerEvent();
			}
		});
	}

	function triggerEvent() {
		jQuery(opts.container).trigger('pageleave');
		if (times == 0) jQuery(opts.container).off('mousemove.pageleave');
	}
})( jQuery );

// Plugin defaults – added as a property on our plugin function.
jQuery.fn.pageleave.defaultOptions = {
	container: document,
	limitX: screen.width,
	limitY: 15,
	timeTillActive: 5000,
	times: 3,
	callback: null
};