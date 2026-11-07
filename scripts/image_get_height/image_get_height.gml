/// @param {Struct.__TexerImage} image
function image_get_height(_image) {
	if (is_instanceof(_image, __TexerImage)) {
		return _image.__source.__height
	}
	return sprite_get_height(_image)
}