/// Checks whether a TexerImage is registered in the atlas
/// @param {Struct.Texer}
/// @param {Struct.__TexerImage,String} image
/// @return {Boolean}
function texer_has_image(_atlas, _image) {
	return _atlas.__HasImage(_image)
}