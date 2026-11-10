function tilegroup_get_last(_tilegroup, _image) {
	__TexerAssertInstanceof(_tilegroup, __TexerTilegroup, tilegroup_get_last)
	return _tilegroup.GetLast(_image)
}