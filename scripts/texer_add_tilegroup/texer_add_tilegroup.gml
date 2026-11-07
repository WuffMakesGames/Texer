function texer_add_tilegroup(_atlas, _name, _cellwidth, _cellheight) {
	var _source = new __TexerTilegroup(_cellwidth, _cellheight)
	var _image = new __TexerImage(_name, _atlas, _source)
	_atlas.__AddImage(_image)
	return _image
}