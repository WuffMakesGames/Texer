/// @arg {Struct.__TexerImage} image
function draw_image_ext(_image, _subimg, _x, _y, _xscale, _yscale, _rot, _col, _alpha) {
	if (is_instanceof(_image, __TexerImage)) {
		return _image.__Draw(_subimg, _x, _y, 0, 0, undefined, undefined, _xscale, _yscale, _rot, _col, _alpha)
	}
	draw_sprite_ext(_image, _subimg, _x, _y,  _xscale, _yscale, _rot, _col, _alpha)
}