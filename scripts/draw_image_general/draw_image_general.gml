/// @param {Struct.__TexerImage} image
function draw_image_general(_image, _subimg, _left, _top, _w, _h, _x, _y, _xscale, _yscale, _rot, _c1, _c2, _c3, _c4, _alpha) {
	if (is_instanceof(_image, __TexerImage)) {
		return _image.__Draw(_subimg, _x, _y, _left, _top, _w, _h, _xscale, _yscale, _rot, _c1, _c2, _c3, _c4, _alpha)
	}
	draw_sprite_general(_image, _subimg, _left, _top, _w, _h, _x, _y, _xscale, _yscale, _rot, _c1, _c2, _c3, _c4, _alpha)
}