function __TexerSourceSurface(_surface, _imgnum, _removeback, _smooth, _xorigin, _yorigin) : __TexerSource(_imgnum, _xorigin, _yorigin) constructor {
	
	__surface = _surface
	__removeback = _removeback
	__smooth = _smooth
	
	static __GetSprite = function() {
		if (!surface_exists(__surface)) return sprite_duplicate(sTexerMissing)
		var _width = surface_get_width(__surface)
		var _height = surface_get_height(__surface)
		return sprite_create_from_surface(__surface, 0, 0, _width, _height, __removeback, __smooth, __xorigin, __yorigin)
	}
	
}