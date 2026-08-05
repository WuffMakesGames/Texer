/// Creates and returns a new texture atlas 
/// @arg {Real} default_size Default width and height for the texture page
/// @return {Struct.Texer}
function texer_create_atlas(_default_size = 1024) {
	return new Texer(_default_size)
}