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
	var _image = texer_add_quad(atlas, $"quad#{_i}", _w, _h, _col)
	var _source = _image.GetSource()
	
}

// Tileserts
tilesGrass = texer_add_quad(atlas, "tilesGrass", 64, 64, c_green)
tilesDesert = texer_add_quad(atlas, "tilesDesert", 64, 16, c_orange)

// Add a tilegroup
tilegroup = texer_add_tilegroup(atlas, "tilesetMain", 16, 16)
tilegroup_add(tilegroup, tilesGrass, tilesDesert)

// Finish batch
texer_finish_batch(atlas)
