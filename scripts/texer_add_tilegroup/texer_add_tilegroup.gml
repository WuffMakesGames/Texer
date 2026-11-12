function texer_add_tilegroup(_atlas, _name, _tilegroup) {
	if (is_string(_atlas)) _atlas = texer_get_atlas(_atlas)
	
	// Assertion checks
	__TexerAssertInstanceof(_atlas, Texer, texer_add_tilegroup)
	__TexerAssertInstanceof(_tilegroup, __TexerTilegroup, texer_add_tilegroup)
	
	// Create and register source
	var _source = new __TexerSourceTilegroup(_tilegroup)
	var _image = new __TexerImage(_name, _atlas, _source)
	_atlas.__AddImage(_image)
	return _image
}