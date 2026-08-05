/*===================================================================
		 /$$$$$$$$                                     
		|__  $$__/                                     
		   | $$  /$$$$$$  /$$   /$$  /$$$$$$   /$$$$$$ 
		   | $$ /$$__  $$|  $$ /$$/ /$$__  $$ /$$__  $$
		   | $$| $$$$$$$$ \  $$$$/ | $$$$$$$$| $$  \__/
		   | $$| $$_____/  >$$  $$ | $$_____/| $$      
		   | $$|  $$$$$$$ /$$/\  $$|  $$$$$$$| $$      
		   |__/ \_______/|__/  \__/ \_______/|__/     v0.0.2
===================================================================*/
// Texer by WuffMakesGames

/// @arg {Real} default_size Default width and height for the texture page
function Texer(_default_size=1024) constructor {
	
	// Variables
	__builder = new __TexerBuilder(self)
	__sprite = -1
	
	__batching = false
	
	__default_size = _default_size
	__size = 0
	
	__images = []
	__images_map = {}
	
	// ==============================================================
	#region Methods
	
	/// Destroys the atlas and all references stored within it
	static __Destroy = function() {
		__Clear()
	}
	
	/// Safely clears memory and destroys the generated texture
	static __Clear = function() {
		if (sprite_exists(__sprite)) sprite_delete(__sprite)
		__images = []
	}
	
	#endregion
	// ==============================================================
	#region Images
	
	/// Checks if any image has a specific name
	static __HasName = function(_name) {
		return struct_exists(__images_map, _name)
	}
	
	/// Checks whether a __TexerImage is registered in the atlas
	/// @arg {Struct.__TexerImage} image
	/// @return {Boolean}
	static __HasImage = function(image) {
		return array_contains(__images, image)
	}
	
	/// Returns a __TexerImage with the same name
	/// @arg {String} name
	/// @return {Struct.__TexerImage}
	static __GetImage = function(_name) {
		return struct_get(__images_map, _name)
	}
	
	/// Adds a __TexerImage to the atlas
	/// @arg {Struct.__TexerImage} image
	static __AddImage = function(_image) {
		if (__HasImage(_image.__name)) return show_debug_message("[Texer] Image with same name already registered: {0}", _image.__name)
		array_push(__images, _image)
		struct_set(__images_map, _image.__name, _image)
		
		// Generate texture page if not batching
		if (!__batching) __Build()
	}
	
	#endregion
	// ==============================================================
	#region Texture page
	
	static __Build = function() {
		if (sprite_exists(__sprite)) sprite_delete(__sprite)
		__sprite = __builder.__Build()
		__size = __builder.__size
	}
	
	#endregion
	// ==============================================================
	#region Getters
	
	/// Returns the texture with a specific image
	static __GetTexture = function(_image, _subimg) {
		// Image/subimg unused as we only store one page
		return sprite_get_texture(__sprite, 0)
	}
	
	#endregion
	// ==============================================================
}