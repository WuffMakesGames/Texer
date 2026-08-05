/// @arg {Struct.__TexerImage} image
function draw_image(_image, _subimg, _x, _y) {
	if (is_instanceof(_image, __TexerImage)) {
		return _image.__Draw(_subimg, _x, _y)
	}
	draw_sprite(_image, _subimg, _x, _y)
}