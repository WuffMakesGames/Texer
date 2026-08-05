/// @arg {Struct.__TexerImage} image
/// @arg {Real} subimg
function image_get_texture(_image, _subimg) {
	if (is_instanceof(_image, __TexerImage)) {
		return _image.__atlas.__GetTexture(_image, _subimg)
	}
	return sprite_get_texture(_image, _subimg)
}