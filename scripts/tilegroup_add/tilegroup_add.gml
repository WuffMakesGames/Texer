/// @function tilegroup_add(tilegroup, image...)
/// @desc Adds an image to a tilegroup.
/// @param {Struct.__TexerTilegroup} tilegroup
/// @param {Struct.__TexerImage} image
function tilegroup_add(_tilegroup, _image) {
	__TexerAssertInstanceof(_tilegroup, __TexerTilegroup, tilegroup_add)
	for (var _i = 1; _i < argument_count; _i++) {
		_tilegroup.AddImage(argument[_i])
	}
}