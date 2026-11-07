/// Returns a __TexerImage with the same name
/// @param {Struct.Texer} atlas
/// @param {String} name
/// @return {Struct.__TexerImage}
function texer_get_image(_atlas, _name) {
	return _atlas.__GetImage(_name)
}