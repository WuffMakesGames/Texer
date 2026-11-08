function __TexerSourceSprite(_spriteIndex, _xorigin, _yorigin) : __TexerSource(sprite_get_number(_spriteIndex), _xorigin, _yorigin) constructor {
	
	__spriteIndex = _spriteIndex
	
	static __GetSprite = function() {
		var _sprite = sprite_duplicate(__spriteIndex)
		sprite_set_offset(_sprite, __xorigin, __yorigin)
		return _sprite
	}
	
}