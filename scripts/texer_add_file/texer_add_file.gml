/// Adds a file to the texture atlas. Returns the image or -1 if the function fails.
/// @arg {Struct.__TexerAtlas} atlas	The texture atlas to add the image to.
/// @arg {String} name				The name to be used when referencing the image in the atlas.
/// @arg {String} filename			The name (a string file path) of the file to add.
/// @arg {Real} imgnum				Use to indicate the number of sub-images (1 for a single image or for a *.gif).
/// @arg {Boolean} removeback		Indicates whether to make all pixels with the background color (left-bottom pixel) transparent.
/// @arg {Boolean} smooth			Indicates whether to smooth the edges if transparent.
/// @arg {Real} xorigin				Indicate the x position of the origin in the sprite.
/// @arg {Real} yorigin				Indicate the y position of the origin in the sprite.
/// @return {Struct.__TexerImage, -1}
function texer_add_file(_atlas, _name, _filename, _imgnum, _removeback, _smooth, _xorig, _yorig) {
	
	// File doesn't exist
	if (!file_exists(_filename)) {
		show_debug_message("[Texer] Couldn't add file to texture atlas, file doesn't exist: {0}", _filename)
		return -1
	}
	
	// Crate and add source to atlas
	var _source = new __TexerSourceFile(_filename, _imgnum, _removeback, _smooth, _xorig, _yorig)
	var _image = new __TexerImage(_name, _atlas, _source)
	_atlas.__AddImage(_image)
	
	// Return name
	return _image
}