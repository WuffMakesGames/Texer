function __TexerSource(_source, _imgnum, _xorigin, _yorigin, _width=0, _height=0) constructor {
	
	// Variables
	__source		= _source
	__loaded		= false
	
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
	
	// Overrides
	static __OnLoad = function() {}
	static __OnUnload = function() {}
	
	/// Draws the source to the screen
	/// Must be currently loaded 
	static __Draw = function(_x, _y) {}
	
	/// Loads the source for image packing
	static __Load = function() {
		if (__loaded) return show_debug_message("[Texer] Couldn't load source. Already loaded")
		__OnLoad()
		__loaded = true
		
		// Update variables
		__width = __total_width / __imgnum
		__pixels = __total_width * __height
	}
	
	/// Unloads the source, freeing memory
	static __Unload = function() {
		if (!__loaded) return show_debug_message("[Texer] Couldn't unload source. Already unloaded")
		__OnUnload()
		__loaded = false
	}
	
	#endregion
	//===============================================================
}