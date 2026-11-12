/// Returns a __TexerImage with the same name
/// @param {Struct.Texer} atlas
/// @param {String} name
/// @return {Struct.__TexerImage}
function texer_get_image(_atlas, _name) {
	if (is_string(_atlas)) _atlas = texer_get_atlas(_atlas)
	
	// Assertion checks
	__TexerAssertInstanceof(_atlas, Texer, texer_add_file)
	
	// Return image
	return _atlas.__GetImage(_name)
}