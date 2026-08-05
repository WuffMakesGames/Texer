/// Creates and returns a new texture atlas 
/// @arg {Real} size Default width and height for the texture page
/// @return {Struct.__TexerAtlas}
function texer_create_atlas(_size = 1024) {
	return new __TexerAtlas(_size)
}