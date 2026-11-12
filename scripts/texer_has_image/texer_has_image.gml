/// Checks whether a TexerImage is registered in the atlas
/// @param {Struct.Texer}
/// @param {Struct.__TexerImage,String} image
/// @return {Boolean}
function texer_has_image(_atlas, _image) {
	if (is_string(_atlas)) _atlas = texer_get_atlas(_atlas)
	
	// Assertion checks
	__TexerAssertInstanceof(_atlas, Texer, texer_add_file)
	
	// Return output
	return _atlas.__HasImage(_image)
}