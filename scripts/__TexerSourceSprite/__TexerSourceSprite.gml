function __TexerSourceSprite(_spriteIndex, _xorigin, _yorigin) : __TexerSource(sprite_get_number(_spriteIndex), _xorigin, _yorigin) constructor {
	
	__spriteIndex = _spriteIndex
	
	static __GetSprite = function() {
		//var _width = sprite_get_width(__spriteIndex)
		//var _height = sprite_get_height(__spriteIndex)
		//var _frames = sprite_get_number(__spriteIndex)
		//var _surface = surface_create(_width * _frames, _height)
		//surface_set_target()
		var _sprite = sprite_duplicate(__spriteIndex)
		sprite_set_offset(_sprite, __xorigin, __yorigin)
		return _sprite
	}
	
}