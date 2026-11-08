function __TexerSourceQuad(_width, _height, _color) : __TexerSource(1, 0, 0, _width, _height) constructor {
	__color = _color
	
	static __GetSprite = function() {
		var _surface = surface_create(__width, __height)
		
		// Render quad to surface
		surface_set_target(_surface)
		draw_clear_alpha(__color, __alpha)
		surface_reset_target()
		
		// Create sprite from surface
		var _sprite = sprite_create_from_surface(_surface, 0, 0, __width, __height, false, false, 0, 0)
		
		// Free surface and return generated sprite
		surface_free(_surface)
		return _sprite
	}
	
}