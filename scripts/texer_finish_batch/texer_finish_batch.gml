/// Finishes batching and generates a texture page for the atlas.
/// @param {Struct.Texer} atlas The texture atlas to finish batching.
function texer_finish_batch(_atlas) {
	if (is_string(_atlas)) _atlas = texer_get_atlas(_atlas)
	
	// Assertion checks
	__TexerAssertInstanceof(_atlas, Texer, texer_add_quad)
	
	// Close batch and build atlas
	if (!_atlas.__batching) return show_debug_message("[Texer] Couldn't finish batch, batch never started.")
	_atlas.__batching = false
	_atlas.__Build()
}