function image_exists(_image) {
	if (is_instanceof(_image, __TexerImage)) {
		return true
	}
	return sprite_exists(_image)
}