function texer_add_surface(_atlas, _name, _surface, _imgnum=1, _removeback=false, _smooth=false, _xorig=0, _yorig=0) {
	
	// Surface doesn't exist
	if (!surface_exists(_surface)) {
		show_debug_message($"[Texer] Couldn't add surface \"{_name}\" to the texture atlas, surface doesn't exist.")
		return -1
	}
	
	// Create and add source to atlas
	var _source = new __TexerSourceSurface(_surface, _imgnum, _removeback, _smooth, _xorig, _yorig)
	var _image = new __TexerImage(_name, _atlas, _source)
	_atlas.__AddImage(_image)
	
	// Return name
	return _image
}