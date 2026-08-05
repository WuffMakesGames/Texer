/// Returns a __TexerImage with the same name
/// @arg {Struct.__TexerAtlas} atlas
/// @arg {String} name
/// @return {Struct.__TexerImage}
function texer_get_image(_atlas, _name) {
	return _atlas.__GetImage(_name)
}