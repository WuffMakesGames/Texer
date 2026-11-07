/*===================================================================
		 /$$$$$$$$                                     
		|__  $$__/                                     
		   | $$  /$$$$$$  /$$   /$$  /$$$$$$   /$$$$$$ 
		   | $$ /$$__  $$|  $$ /$$/ /$$__  $$ /$$__  $$
		   | $$| $$$$$$$$ \  $$$$/ | $$$$$$$$| $$  \__/
		   | $$| $$_____/  >$$  $$ | $$_____/| $$      
		   | $$|  $$$$$$$ /$$/\  $$|  $$$$$$$| $$      
		   |__/ \_______/|__/  \__/ \_______/|__/     v0.0.23-alpha
===================================================================*/
// Texer by WuffMakesGames

/// @param {Real} default_size Default width and height for the texture page
function Texer(_default_size=1024) constructor {
	
	// Variables
	__builder = new __TexerBuilder(self)
	__images = new __TexerImageMap()
	
	__batching = false
	
	__sprite = -1
	__default_size = _default_size
	__size = 0
	
	// ==============================================================
	#region Methods
	
	/// @function __Destroy()
	/// @desc Destroys the atlas and all references stored within it
	static __Destroy = function() {
		__Clear()
	}
	
	/// @function __Clear()
	/// @desc Safely clears memory and destroys the generated texture
	static __Clear = function() {
		if (sprite_exists(__sprite)) sprite_delete(__sprite)
		__images.__Clear()
	}
	
	#endregion
	// ==============================================================
	#region Images
	
	/// @function __HasImage(image)
	/// @desc Checks if a TexerImage is registered in the atlas
	/// @param {Struct.__TexerImage} image
	/// @return {Boolean}
	static __HasImage = function(_image) {
		return __images.__HasImage(_image)
	}
	
	/// @function __GetImage(name)
	/// @desc Returns a __TexerImage with the same name
	/// @param {String} name
	/// @return {Struct.__TexerImage}
	static __GetImage = function(_name) {
		return __images.__GetImage(_name)
	}
	
	/// @function __AddImage(image)
	/// @desc Adds a __TexerImage to the atlas
	/// @param {Struct.__TexerImage} image
	static __AddImage = function(_image) {
		var _success = __images.__AddImage(_image)
		if (!_success) return show_debug_message($"[Texer] Image with name \"{_image.__name}\"already registered")
		
		// Generate texture page when not batching
		if (!__batching) __Build()
	}
	
	#endregion
	// ==============================================================
	#region Texture page
	
	/// @function __Build()
	static __Build = function() {
		if (sprite_exists(__sprite)) sprite_delete(__sprite)
		__sprite = __builder.__Build()
		__size = __builder.__size
	}
	
	#endregion
	// ==============================================================
	#region Getters
	
	/// @function __GetTexture(image, subimg)
	/// @desc Returns the texture with a specific image
	static __GetTexture = function(_image, _subimg) {
		// Image/subimg unused as we only store one page
		return sprite_get_texture(__sprite, 0)
	}
	
	#endregion
	// ==============================================================
}