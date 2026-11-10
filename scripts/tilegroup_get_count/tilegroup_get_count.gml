function tilegroup_get_count(_tilegroup, _image) {
	__TexerAssertInstanceof(_tilegroup, __TexerTilegroup, tilegroup_get_count)
	return _tilegroup.GetCount(_image)
}