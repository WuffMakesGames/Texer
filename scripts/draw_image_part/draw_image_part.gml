/// @arg {Struct.__TexerImage} image
function draw_image_part(_image, _subimg, _left, _top, _width, _height, _x, _y) {
	if (is_instanceof(_image, __TexerImage)) {
		return _image.__Draw(_subimg, _x, _y, _left, _top, _width, _height, 1, 1, 0, c_white, c_white, c_white, c_white, 1)
	}
	draw_sprite_part(_image, _subimg, _left, _top, _width, _height, _x, _y)
}