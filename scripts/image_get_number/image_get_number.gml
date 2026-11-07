/// @param {Struct.__TexerImage} image
function image_get_number(_image) {
	if (is_instanceof(_image, __TexerImage)) {
		return _image.__source.__imgnum
	}
	return sprite_get_number(_image)
}