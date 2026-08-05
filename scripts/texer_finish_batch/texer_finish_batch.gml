/// Finishes batching and generates a texture page for the atlas.
/// @arg {Struct.__TexerAtlas} atlas The texture atlas to finish batching.
function texer_finish_batch(_atlas) {
	if (!_atlas.__batching) return show_debug_message("[Texer] Couldn't finish batch, batch never started.")
	_atlas.__batching = false
	_atlas.__Build()
}