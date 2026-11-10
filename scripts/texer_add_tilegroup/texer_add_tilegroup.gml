function texer_add_tilegroup(_atlas, _name, _tilegroup) {
	var _source = new __TexerSourceTilegroup(_tilegroup)
	var _image = new __TexerImage(_name, _atlas, _source)
	_atlas.__AddImage(_image)
	return _image
}