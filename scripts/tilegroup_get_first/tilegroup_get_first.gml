function tilegroup_get_first(_tilegroup, _image) {
	__TexerAssertInstanceof(_tilegroup, __TexerTilegroup)
	return _tilegroup.GetFirst(_image)
}