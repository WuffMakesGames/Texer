/// Frees the atlas from memory by calling its internal destroy method
/// @param {Struct.Texer} atlas The texture atlas to destroy.
function texer_destroy_atlas(_atlas) {
	_atlas.__Destroy()
}