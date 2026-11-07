function __TexerInstance() constructor {
	
	__atlases = {}
	
	/// @function __HasAtlas(name)
	/// @param {String} name
	/// @return {Boolean}
	static __HasAtlas = function(_name) {
		return struct_exists(__atlases, _name)
	}
	
	/// @function __GetAtlas(name)
	/// @param {String} name
	/// @return {Struct.Texer}
	static __GetAtlas = function(_name) {
		return struct_get(__atlases, _name)
	}
	
	/// @function __AddAtlas(name, atlas)
	/// @param {String} name
	/// @param {Struct.Texer} atlas
	static __AddAtlas = function(_name, _atlas) {
		if (__HasAtlas(_name)) show_error($"[Texer] Error - Atlas with name {_name} already exists.", true)
		struct_set(__atlases, _name, _atlas)
	}
	
}