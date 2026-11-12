/// Frees the atlas from memory by calling its internal destroy method
/// @param {Struct.Texer} atlas The texture atlas to destroy.
function texer_destroy_atlas(_atlas) {
	if (is_string(_atlas)) _atlas = texer_get_atlas(_atlas)
	
	// Assertion checks
	__TexerAssertInstanceof(_atlas, Texer, texer_add_file)
	
	// Destroy atlas
	_atlas.__Destroy()
}