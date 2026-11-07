/// @param {Struct.__TexerImage} image
function image_get_width(_image) {
	if (is_instanceof(_image, __TexerImage)) {
		return _image.__source.__width
	}
	return sprite_get_width(_image)
}