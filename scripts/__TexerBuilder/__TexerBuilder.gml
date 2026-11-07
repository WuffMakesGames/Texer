function __TexerBuilder(_atlas) constructor {
	__atlas = _atlas
	__quads = []
	__size = 0
	
	/// Generates a texture page
	static __Build = function() {
		var _images = __atlas.__images.images
		var _output = -1
		
		// Variables
		var _count = array_length(_images)
		var _time_started = current_time
		
		// Load image sources
		for (var i = 0; i < _count; i++) _images[i].__source.__Load()
		
		// Sort image sources by pixel count
		array_sort(_images, function(a,b) {
			return b.__source.__pixels - a.__source.__pixels
		})
		
		// Attempt to pack every texture into a page
		var _size = __atlas.__default_size
		var _result = __PackSources(_size)
		
		while (!_result.success) {
			_size = _size * 2
			
			// Texture too big
			if (_size >= 16384) {
				show_debug_message("[Texer] Couldn't generate a texture page, too big {0}x{0}", _size)
				break
			}
			
			// Retry packing
			_result = __PackSources(_size)
		}
		
		// Generate atlas
		if (_result.success) {
			
			// Surface
			var _surface = surface_create(_size, _size)
			surface_set_target(_surface)
			
			// Draw image sources to surface
			for (var i = 0; i < array_length(_images); i++) {
				var _image = _images[i]
				_image.__source.__Draw(_image.__x, _image.__y)
			}
			
			// Surface
			surface_reset_target()
			
			// Create sprite
			_output = sprite_create_from_surface(_surface, 0, 0, _size, _size, false, false, 0, 0)
			__quads = _result.quads
			__size = _size
			
			// Finishing up
			surface_free(_surface)
			show_debug_message("[Texer] Finished generating texture page in {0}ms", current_time - _time_started)
		
		// Failed to generate texture page
		} else {
			show_debug_message("[Texer] Failed to generate texture page in {0}ms", current_time - _time_started)
			
		}
		
		// Unload all image sources
		for (var i = 0; i < _count; i++) _images[i].__source.__Unload()
		
		// Return sprites
		return _output
	}
	
	/// Attempts to pack all sources into a texture page
	/// @return {Struct}
	static __PackSources = function(_size) {
		var _images = __atlas.__images.images
		var _fit_count = 0
		var _result = {
			success: false,
			quads: [],
		}
		
		// Fit all image sources
		for (var i = 0; i < array_length(_images); i++) {
			var _image = _images[i]
			var _source = _image.__source
			var _w = _source.__total_width
			var _h = _source.__height
			var _fit = false
			
			//show_debug_message("Packing sprite {0}", i)
			
			for (var _y = 0; _y <= _size - _h; _y++) {
				for (var _x = 0; _x <= _size - _w; _x++) {
					var _quad = [ _x, _y, _x + _w-1, _y + _h-1, make_colour_rgb(random(255),random(255),random(255)) ]
					_fit = true
					
					// Check for overlap at position
					// Skip to right of overlapping quad if overlapping
					for (var ii = 0; ii < array_length(_result.quads); ii++) {
						var _other = _result.quads[ii]
						if (rectangle_in_rectangle(_quad[0], _quad[1], _quad[2], _quad[3], _other[0], _other[1], _other[2], _other[3])) {
							_fit = false
							_x = _other[2]
							break;
						}
					}
				
					// Fits at position
					if (_fit) {
						//show_debug_message("Fit texture at {0},{1}", _x, _y)
						array_push(_result.quads, _quad)
						_fit_count += 1
						_image.__x = _x
						_image.__y = _y
						break;
					}
				}
				
				// Already fit sprite
				if (_fit) break;
			}
		}
		
		// Update results
		if (_fit_count >= array_length(_images)) {
			_result.success = true
		}
		
		// Return results
		return _result
	}
}