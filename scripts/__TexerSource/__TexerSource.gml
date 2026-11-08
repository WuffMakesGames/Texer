function __TexerSource(_imgnum, _xorigin, _yorigin, _width=0, _height=0) constructor {
	
	// Variables
	__sprite		= -1
	
	__imgnum		= _imgnum
	__xorigin		= _xorigin
	__yorigin		= _yorigin
	
	__width			= _width
	__height		= _height
	
	__total_width	= 0
	__pixels		= 0
	
	__color			= c_white
	__alpha			= 1
	
	//===============================================================
	#region Public methods
	
	/// Sets the origin of the image source
	static SetOrigin = function(_xorigin, _yorigin) {
		__xorigin = _xorigin
		__yorigin = _yorigin
	}
	
	/// Sets the color blend of the image source
	static SetBlend = function(_color, _alpha) {
		__color = _color
		__alpha = _alpha
	}
	
	#endregion
	//===============================================================
	#region Private methods
	
	/// @function __GetSprite()
	static __GetSprite = function() {
		return -1
	}
	
	/// @function __Draw(x, y)
	/// @desc Renders the source to the screen if it has been loaded.
	static __Draw = function(_x, _y) {
		if (!sprite_exists(__sprite)) return show_debug_message("[Texer] Attempted to draw unloaded source!")
		draw_sprite_ext(__sprite, 0, _x, _y, 1, 1, 0, __color, __alpha)
	}
	
	/// @function __Load()
	/// @desc Loads the source for image packing.
	static __Load = function() {
		if (sprite_exists(__sprite)) return show_debug_message("[Texer] Couldn't load source. Already loaded.")
		__sprite = __GetSprite()
		
		// Failed to load source
		if (!sprite_exists(__sprite)) return show_debug_message("[Texer] Failed to load image source.")
		
		// Process source
		__total_width = sprite_get_width(__sprite)
		__width = __total_width / __imgnum
		__height = sprite_get_height(__sprite)
		__pixels = __total_width * __height
	}
	
	/// @function __Unload()
	/// @desc Deletes the loaded sprite to free up memory.
	static __Unload = function() {
		if (!sprite_exists(__sprite)) return show_debug_message("[Texer] Couldn't unload source. Already unloaded.")
		sprite_delete(__sprite)
	}
	
	#endregion
	//===============================================================
}