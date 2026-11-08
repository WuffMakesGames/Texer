function __TexerImageMap() constructor {
	
	images_map = {}
	images = []
	
	/// @function __Clear()
	/// @desc Removes all images from the image map.
	static __Clear = function() {
		images_map = {}
		images = []
	}
	
	/// @function __HasImage(image)
	/// @desc Returns whether the map contains an image.
	/// @param {Struct.__TexerImage,String} image
	/// @return {Boolean}
	static __HasImage = function(_image) {
		if (is_string(_image)) return struct_exists(images_map, _image)
		return array_contains(images, _image)
	}
	
	/// @function __GetImage(name)
	/// @desc Returns a TexerImage with the same name
	/// @param {String} name
	/// @return {Struct.__TexerImage}
	static __GetImage = function(_name) {
		return struct_get(images_map, _name)
	}
	
	/// @function __GetImageAt(index)
	/// @param {Real} index
	/// @return {Struct.__TexerImage}
	static __GetImageAt = function(_index) {
		return images[_index]
	}
	
	/// @function __AddImage(image)
	/// @desc Adds a TexerImage to the map
	/// @param {Struct.__TexerImage} image
	/// @return {Boolean}
	static __AddImage = function(_image) {
		if (__HasImage(_image)) return false
		array_push(images, _image)
		struct_set(images_map, _image.__name, _image)
		return true
	}
	
}