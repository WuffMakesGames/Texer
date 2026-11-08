function texer_add_sprite(_atlas, _name, _sprite, _xorig=sprite_get_xoffset(_sprite), _yorig=sprite_get_yoffset(_sprite)) {
	var _source = new __TexerSourceSprite(_sprite, _xorig, _yorig)
	var _image = new __TexerImage(_name, _atlas, _source)
	_atlas.__AddImage(_image)
	return _image
}