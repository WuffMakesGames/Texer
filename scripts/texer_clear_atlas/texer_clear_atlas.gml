/// Cleans up the atlas to be reused in the future
/// @param {Struct.Texer} atlas The texture atlas to clear.
function texer_clear_atlas(_atlas) {
	if (is_string(_atlas)) _atlas = texer_get_atlas(_atlas)
	
	// Assertion checks
	__TexerAssertInstanceof(_atlas, Texer, texer_add_file)
	
	// Clear atlas
	_atlas.__Clear()
}