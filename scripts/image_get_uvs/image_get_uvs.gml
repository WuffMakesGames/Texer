/// @param {Struct.__TexerImage} image
/// @param {Real} subimg
function image_get_uvs(_image, _subimg) {
	if (is_instanceof(_image, __TexerImage)) {
		return _image.__GetUVs(_subimg)
	}
	return sprite_get_uvs(_image, _subimg)
}