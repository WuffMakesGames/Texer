/// Cleans up the atlas to be reused in the future
/// @param {Struct.Texer} atlas The texture atlas to clear.
function texer_clear_atlas(_atlas) {
	_atlas.__Clear()
}