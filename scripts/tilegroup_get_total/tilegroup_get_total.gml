function tilegroup_get_total(_tilegroup) {
	__TexerAssertInstanceof(_tilegroup, __TexerTilegroup, tilegroup_get_total)
	return _tilegroup.GetTotal()
}