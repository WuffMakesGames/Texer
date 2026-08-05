/// Checks whether a TexerImage is registered in the atlas
/// @arg {Struct.__TexerAtlas}
/// @arg {Struct.__TexerImage} image
/// @return {Boolean}
function texer_has_image(_atlas, _image) {
	return _atlas.__HasImage(_image)
}