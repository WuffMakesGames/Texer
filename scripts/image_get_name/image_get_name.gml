/// @arg {Struct.__TexerImage} image
function image_get_name(_image) {
	if (is_instanceof(_image, __TexerImage)) {
		return _image.__name
	}
	return sprite_get_name(_image)
}