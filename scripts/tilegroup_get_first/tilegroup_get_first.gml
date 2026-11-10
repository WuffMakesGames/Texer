function tilegroup_get_first(_tilegroup, _image) {
	if (is_instanceof(_tilegroup, __TexerTilegroup)) return _tilegroup.GetFirst(_image)
	return -1
}