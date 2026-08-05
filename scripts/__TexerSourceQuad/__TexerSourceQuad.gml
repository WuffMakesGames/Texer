function __TexerSourceQuad(_width, _height, _color) : __TexerSource(-1, 1, 0, 0, _width, _height) constructor {
	__color = _color
	
	static __Draw = function(_x, _y) {
		draw_set_color(__color)
		draw_rectangle(_x, _y, _x+__width-1, _y+__height-1, false)
		draw_set_color(c_white)
	}
	
	static __OnLoad = function() {
		__total_width = __width
	}
	
}