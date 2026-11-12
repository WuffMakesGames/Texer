function tilegroup_get_last(_tilegroup, _image) {
	__TexerAssertInstanceof(_tilegroup, __TexerTilegroup)
	return _tilegroup.GetLast(_image)
}