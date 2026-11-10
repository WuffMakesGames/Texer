function tilegroup_get_last(_tilegroup, _image) {
	if (is_instanceof(_tilegroup, __TexerTilegroup)) return _tilegroup.GetLast(_image)
	return -1
}