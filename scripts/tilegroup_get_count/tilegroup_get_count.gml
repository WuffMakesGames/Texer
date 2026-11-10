function tilegroup_get_count(_tilegroup, _image) {
	if (is_instanceof(_tilegroup, __TexerTilegroup)) return _tilegroup.GetCount(_image)
	return -1
}