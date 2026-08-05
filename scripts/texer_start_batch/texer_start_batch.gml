/// Begins batching texture sources. Useful when adding multiple images to a texture atlas at once. Finish batching with texer_finish_batch(atlas).
/// @arg {Struct.__TexerAtlas} atlas The texture atlas start batching within.
function texer_start_batch(atlas) {
	atlas.__batching = true
}