/// @arg {Struct.__TexerImage} image
function draw_image_tiled(_image, _subimg, _x, _y) {
	if (is_instanceof(_image, __TexerImage)) {
		return _image.__DrawTiled(_subimg, _x, _y, 1, 1, c_white, 1)
	}
	draw_sprite_tiled(_image, _subimg, _x, _y)
}