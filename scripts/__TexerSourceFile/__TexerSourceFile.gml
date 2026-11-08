function __TexerSourceFile(_filename, _imgnum, _removeback, _smooth, _xorigin, _yorigin) : __TexerSource(_imgnum, _xorigin, _yorigin) constructor {
	
	__filename = _filename
	__removeback = _removeback
	__smooth = _smooth
	
	static __GetSprite = function() {
		return sprite_add(__source, 1, __removeback, __smooth, 0, 0)
	}
	
}