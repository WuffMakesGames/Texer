function __TexerAssertInstanceof(_struct, _constructor, _context="") {
	if (!is_instanceof(_struct, _constructor)) {
		if (script_exists(_constructor)) _constructor = script_get_name(_constructor)
		if (script_exists(_context)) _context = script_get_name(_context)
		__TexerThrowError($"Value must be instance of {_constructor} in {_context}")
	}
}
