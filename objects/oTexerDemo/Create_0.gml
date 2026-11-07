/// @description 

atlas = texer_create_atlas("default", 512)

// Begin batch
texer_start_batch(atlas)

// Add a bunch of quads
for (var _i = 0; _i < 50; _i++) {
	var _w = random_range(25,100)
	var _h = random_range(25,100)
	var _col = make_colour_rgb(random(255), random(255), random(255))
	
	// Create quad
	var _image = texer_add_quad(atlas, $"Quad{_i}", _w, _h, _col)
	var _source = _image.GetSource()
	
}

// Finish batch
texer_finish_batch(atlas)
