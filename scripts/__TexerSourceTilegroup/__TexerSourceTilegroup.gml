function __TexerSourceTilegroup(_tilegroup) : __TexerSource(1, 0, 0) constructor {
	
	tilegroup = _tilegroup
	
	static __GetSprite = function() {
		return tilegroup.__GenerateAtlas()
	}
}