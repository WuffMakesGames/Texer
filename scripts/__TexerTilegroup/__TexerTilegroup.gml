function __TexerTilegroup(_cellwidth, _cellheight) : __TexerSource(-1, 1, 0, 0) constructor {
	
	images = new __TexerImageMap()
	cellwidth = _cellwidth
	cellheight = _cellheight
	
	static __AddImage = function(_image) {
		images.__AddImage(_image)
	}
	
	static __GetSprite = function() {
		var _sprites = []
		var _totalTiles = 0
		
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
				var _tilecount = (_width / cellwidth) * (_height / cellheight)
				show_debug_message($"[Texer] Added tileset with {_tilecount} tiles to tilegroup.")
				_totalTiles += _tilecount
				//_totalArea += sprite_get_width(_sprite) * sprite_get_height(_sprite)
			}
		}
		
		// Generate tileset
		var _perimeter = ceil(sqrt(_totalTiles))
		show_debug_message($"[Texer] Generating tilegroup with perimeter of ({_perimeter}x{_perimeter})")
		
		// Delete all sprites
		array_foreach(_sprites, sprite_delete)
		
		// Return generated tileset
		return sprite_duplicate(sTexerMissing)
	}
	
}