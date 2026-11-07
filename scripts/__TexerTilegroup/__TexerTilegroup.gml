function __TexerTilegroup(_cellwidth, _cellheight) : __TexerSource(-1, 1, 0, 0) constructor {
	
	images = new __TexerImageMap()
	cellwidth = _cellwidth
	cellheight = _cellheight
	
	static __AddImage = function(_image) {
		images.__AddImage(_image)
	}
	
	static __Draw = function(_x, _y) {
		draw_sprite_ext(__sprite, 0, _x, _y, 1, 1, 0, __color, __alpha)
	}
	
	static __OnLoad = function() {
		// Load all sources
		__sprite = sprite_add(__source, 1, __removeback, __smooth, 0, 0)
		__total_width = sprite_get_width(__sprite)
		__height = sprite_get_height(__sprite)
	}
	
	static __OnUnload = function() {
		sprite_delete(__sprite)
	}
	
}