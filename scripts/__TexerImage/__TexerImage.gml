/// @param {String} name
/// @param {Struct.Texer} atlas
/// @param {Struct.__TexerSource} source
function __TexerImage(_name, _atlas, _source) constructor {
	__name = _name
	__atlas = _atlas
	__source = _source
	
	__x = 0
	__y = 0
	__uvs = []
	
	//===============================================================
	#region Public Methods
	
	/// Returns the unique name of the image
	/// @return {String}
	static GetName = function() {
		return __name
	}
	
	/// Returns the image source of the image
	/// @return {Struct.__TexerSource}
	static GetSource = function() {
		return __source
	}
	
	/// Returns the atlas containing the image
	/// @return {Struct.Texer}
	static GetAtlas = function() {
		return __atlas
	}
	
	#endregion
	//===============================================================
	#region Private methods
	
	/// Draws the image to the screen with various arguments
	static __Draw = function(_subimg, _x, _y, _left=0, _top=0, _width=__source.__width, _height=__source.__height, _xscale=1, _yscale=1, _rot=0, _c1=c_white, _c2=_c1, _c3=_c1, _c4=_c1, _alpha=1) {
		_subimg = floor(_subimg % __source.__imgnum)
		draw_sprite_general(__atlas.__sprite, 0,
			__x + _subimg * __source.__width + _left, __y + _top,
			_width, _height,
			_x - __source.__xorigin * _xscale,
			_y - __source.__yorigin * _yscale,
			_xscale, _yscale,
			_rot, _c1, _c2, _c3, _c4, _alpha
		)
	}
	
	/// Draws the image tiled across the view
	static __DrawTiled = function(_subimg, _x, _y, _xscale, _yscale, _color, _alpha) {
		var _sprite = __atlas.__sprite
		
		var _sprite_x = __x + _subimg * __source.__width
		var _sprite_y = __y
		var _sprite_w = __source.__width
		var _sprite_h = __source.__height
		
		var _w = _sprite_w * _xscale
		var _h = _sprite_h * _yscale
		
		var _view_x = camera_get_view_x(view_camera[view_current])
		var _view_y = camera_get_view_y(view_camera[view_current])
		var _view_w = camera_get_view_width(view_camera[view_current])
		var _view_h = camera_get_view_height(view_camera[view_current])
		
		var _tiles_x = ceil(_view_w / _w) + 1
		var _tiles_y = ceil(_view_h / _h) + 1
		var _total_x = _tiles_x * _w
		var _total_y = _tiles_y * _h
		
		var _i = 0
		var _ii = 0
		
		repeat (_tiles_x) {
			_ii = 0
			repeat (_tiles_y) {
				draw_sprite_part_ext(
					_sprite, 0, _sprite_x, _sprite_y, _sprite_w, _sprite_h, 
					_view_x + (_x + _i * _w) % _total_x - _w,
					_view_y + (_y + _ii * _h) % _total_y - _h,
					_xscale, _yscale, _color, _alpha
				)
				_ii += 1
			}
			_i += 1
		}
	}
	
	/// Returns the uvs of a specific frame
	static __GetUVs = function(_subimg) {
		var _left = __x + __source.__width * floor(_subimg%__source.__imgnum)
		return [
			_left/__atlas.__size,						// Left of the image UV
			__y/__atlas.__size,							// Top of the image UV
			(_left+__source.__width)/__atlas.__size,	// Right of the image UV
			(__y+__source.__height)/__atlas.__size,		// Bottom of the image UV
			0,											// Pixels trimmed off the left of the image
			0,											// Pixels trimmed off the top of the image
			__source.__width/__atlas.__size,			// Normalized width of image
			__source.__height/__atlas.__size			// Normalized height of image
		]
	}
	
	#endregion
	//===============================================================
}