/// Adds a file to the texture atlas
/// @arg {Struct.Texer} atlas	The texture atlas to add the rect to.
/// @arg {String} name				The name to be used when referencing the rect in the atlas.
/// @arg {Real} width				The horizontal size of the rect.
/// @arg {Real} height				The vertical size of the rect.
/// @arg {Real} color				The color of the rect.
/// @return {Struct.__TexerImage}
function texer_add_quad(_atlas, _name, _w, _h, _color) {
	var _source = new __TexerSourceQuad(_w, _h, _color)
	var _image = new __TexerImage(_name, _atlas, _source)
	_atlas.__AddImage(_image)
	return _image
}