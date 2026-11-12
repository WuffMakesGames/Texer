/// Begins batching texture sources. Useful when adding multiple images to a texture atlas at once. Finish batching with texer_finish_batch(atlas).
/// @param {Struct.Texer} atlas The texture atlas start batching within.
function texer_start_batch(_atlas) {
	if (is_string(_atlas)) _atlas = texer_get_atlas(_atlas)
	
	// Assertion checks
	__TexerAssertInstanceof(_atlas, Texer, texer_add_quad)
	
	// Begin batching
	_atlas.__batching = true
}