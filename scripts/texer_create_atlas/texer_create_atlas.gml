/// @desc Creates and returns a new texture atlas 
/// @arg {String} name
/// @arg {Real} default_size Default width and height for the texture page
/// @return {Struct.Texer}
function texer_create_atlas(_name, _default_size = 1024) {
	var _instance = __Texer()
	var _atlas = new Texer(_default_size)
	_instance.__AddAtlas(_name, _atlas)
	return _atlas
}