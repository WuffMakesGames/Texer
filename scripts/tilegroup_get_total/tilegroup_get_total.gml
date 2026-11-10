function tilegroup_get_total(_tilegroup) {
	if (is_instanceof(_tilegroup, __TexerTilegroup)) return _tilegroup.GetTotal()
	return -1
}