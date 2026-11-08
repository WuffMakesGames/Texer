/// @function tilegroup_add(tilegroup, image)
/// @desc Adds an image to a tilegroup.
/// @param {Struct.__TexerImage} tilegroup
/// @param {String} image
function tilegroup_add(_tilegroup, _image) {
	if (is_instanceof(_tilegroup.__source, __TexerTilegroup)) {
		for (var _i = 1; _i < argument_count; _i++) {
			_tilegroup.__source.__AddImage(argument[_i])
		}
	}
}