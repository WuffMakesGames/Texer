/// @arg {Struct.__TexerImage} image
function draw_image_tiled_ext(_image, _subimg, _x, _y, _xscale, _yscale, _color, _alpha) {
	if (is_instanceof(_image, __TexerImage)) {
		return _image.__DrawTiled(_subimg, _x, _y, _xscale, _yscale, _color, _alpha)
	}
	draw_sprite_tiled_ext(_image, _subimg, _x, _y, _xscale, _yscale, _color, _alpha)
}