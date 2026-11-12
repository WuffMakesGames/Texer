function tilegroup_get_total(_tilegroup) {
	__TexerAssertInstanceof(_tilegroup, __TexerTilegroup)
	return _tilegroup.GetTotal()
}