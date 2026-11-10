function __TexerTilegroup(_cellwidth, _cellheight)  constructor {
	
	__totalCount = 0
	__cache = {}
	
	images = new __TexerImageMap()
	cellwidth = _cellwidth
	cellheight = _cellheight
	
	/// @function GetTotal()
	static GetTotal = function() {
		return __totalCount
	}
	
	/// @function GetFirst(image)
	static GetFirst = function(_image) {
		if (is_instanceof(_image, __TexerImage)) _image = _image.__name
		if (Contains(_image)) return struct_get(__cache, _image).first
		return -1
	}
	
	/// @function GetLast(image)
	static GetLast = function(_image) {
		if (is_instanceof(_image, __TexerImage)) _image = _image.__name
		if (Contains(_image)) return struct_get(__cache, _image).last
		return -1
	}
	
	/// @function GetCount(image)
	static GetCount = function(_image) {
		if (is_instanceof(_image, __TexerImage)) _image = _image.__name
		if (Contains(_image)) return struct_get(__cache, _image).count
		return -1
	}
	
	/// @function Contains(image)
	static Contains = function(_image) {
		if (is_instanceof(_image, __TexerImage)) _image = _image.__name
		return struct_exists(__cache, _image)
	}
	
	/// @function AddImage(image)
	/// @param {Struct.__TexerImage} image
	static AddImage = function(_image) {
		images.__AddImage(_image)
	}
	
	/// @function __GenerateAtlas()
	/// @return {Asset.GMSprite}
	static __GenerateAtlas = function() {
		__totalCount = 0
		__cache = {}
		
		// Temp variables
		var _sprites = []
		
		// Load all sprites
		for (var _i = 0; _i < array_length(images.images); _i++) {
			var _image = images.__GetImageAt(_i)
			var _sprite = _image.__source.__GetSprite()
			
			// Add sprite to list
			if (sprite_exists(_sprite)) {
				array_push(_sprites, _sprite)
				
				// Process sprite
				var _width = sprite_get_width(_sprite)
				var _height = sprite_get_height(_sprite)
				var _frames = sprite_get_number(_sprite)
				var _tilecount = (_width / cellwidth) * (_height / cellheight) * _frames
				
				// Cache sprite data
				struct_set(__cache, _image.__name, {
					count: _tilecount,
					first: __totalCount,
					last: __totalCount + _tilecount-1,
				})
				
				// Continue
				__TexerLoggerInfo($"Added tileset with {_tilecount} tiles to tilegroup.")
				__totalCount += _tilecount
				
			}
		}
		
		// Generate tileset
		var _perimeter = max(ceil(sqrt(__totalCount)), 1)
		var _surface = surface_create(_perimeter * cellwidth, _perimeter * cellheight)
		__TexerLoggerInfo($"Generating tilegroup with perimeter of ({_perimeter}x{_perimeter})")
		
		// Set surface
		surface_set_target(_surface)
		draw_clear_alpha(c_white, 0.0)
		
		// Draw tiles to tileset
		var _i, _sprite, _subimg, _x, _y, _drawX, _drawY
		var _index = 0
		
		for (_i = 0; _i < array_length(_sprites); _i++) {
			_sprite = _sprites[_i]
			for (_subimg = 0; _subimg < sprite_get_number(_sprite); _subimg++) {
				for (_y = 0; _y < sprite_get_height(_sprite); _y += cellheight) {
				for (_x = 0; _x < sprite_get_width(_sprite); _x += cellwidth) {
					_drawX = (_index % _perimeter) * cellwidth
					_drawY = floor(_index / _perimeter) * cellheight
					_index += 1
					draw_sprite_part(_sprite, _subimg, _x, _y, cellwidth, cellheight, _drawX, _drawY)
				} }
			}
		}
		
		// Reset and free sprites
		surface_reset_target()
		array_foreach(_sprites, sprite_delete)
		
		// Return generated tileset
		var _output = sprite_create_from_surface(_surface, 0, 0, surface_get_width(_surface), surface_get_height(_surface), false, false, 0, 0)
		surface_free(_surface)
		
		return _output
	}
	
}