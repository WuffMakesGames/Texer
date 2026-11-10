function tilegroup_get_first(_tilegroup, _image) {
	__TexerAssertInstanceof(_tilegroup, __TexerTilegroup, tilegroup_get_first)
	return _tilegroup.GetFirst(_image)
}