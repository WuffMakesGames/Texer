function __TexerSourceFile(_source,_imgnum,_removeback,_smooth,_xorigin,_yorigin) : __TexerSource(_source,_imgnum,_xorigin,_yorigin) constructor {
	
	__removeback = _removeback
	__smooth = _smooth
	__sprite = -1
	
	/// Draws the source to the screen
	/// Must be currently loaded 
	static __Draw = function(_x, _y) {
		draw_sprite_ext(__sprite, 0, _x, _y, 1, 1, 0, __color, __alpha)
	}
	
	/// Loads the source for image packing
	static __OnLoad = function() {
		__sprite = sprite_add(__source, 1, __removeback, __smooth, 0, 0)
		__total_width = sprite_get_width(__sprite)
		__height = sprite_get_height(__sprite)
	}
	
	/// Unloads the source, freeing memory
	static __OnUnload = function() {
		sprite_delete(__sprite)
	}
}