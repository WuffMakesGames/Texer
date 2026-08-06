/// @arg {Struct.__TexerImage} image
function draw_image_part_ext(_image, _subimg, _left, _top, _width, _height, _x, _y, _xscale, _yscale, _col, _alpha) {
	if (is_instanceof(_image, __TexerImage)) {
		return _image.__Draw(_subimg, _x, _y, _left, _top, _width, _height, _xscale, _yscale, 0, _col, _col, _col, _col, _alpha)
	}
	draw_sprite_part_ext(_image, _subimg, _left, _top, _width, _height, _x, _y, _xscale, _yscale, _col, _alpha)
}