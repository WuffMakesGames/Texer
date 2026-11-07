/// @function tilegroup_add(tilegroup, image)
/// @desc Adds an image to a tilegroup.
/// @param {Struct.__TexerTilegroup} tilegroup
/// @param {String} image
function tilegroup_add(_tilegroup, _image) {
	for (var _i = 1; _i < argument_count; _i++) {
		_tilegroup.__AddImage(argument[_i])
	}
}