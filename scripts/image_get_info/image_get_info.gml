/// @param {Struct.__TexerImage} image
function image_get_info(_image) {
	if (is_instanceof(_image, __TexerImage)) {
		return -1
	}
	return sprite_get_info(_image)
}