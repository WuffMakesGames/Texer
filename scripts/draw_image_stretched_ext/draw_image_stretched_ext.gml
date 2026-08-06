/// @arg {Struct.__TexerImage} image
function draw_image_stretched_ext(_image, _subimg, _x, _y, _w, _h, _col, _alpha) {
	if (is_instanceof(_image, __TexerImage)) {
		var _image_w = _image.__source.__width
		var _image_h = _image.__source.__height
		return _image.__Draw(_subimg, _x, _y, 0, 0, _image_w, _image_h, _w/_image_w, _h/_image_h, 0, _col, _col, _col, _col, _alpha)
	}
	draw_sprite_stretched_ext(_image, _subimg, _x, _y, _w, _h, _col, _alpha)
}