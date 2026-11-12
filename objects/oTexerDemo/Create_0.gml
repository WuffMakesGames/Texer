/// @description 

randomize()

// Variables
atlas = texer_create_atlas("default", 512)
tilegroupMain = texer_create_tilegroup(16, 16)

// Begin batch
texer_start_batch("default")

// Add a bunch of quads
for (var _i = 0; _i < 50; _i++) {
	var _w = random_range(25,100)
	var _h = random_range(25,100)
	var _col = make_colour_rgb(random(255), random(255), random(255))
	texer_add_quad("default", $"quad#{_i}", _w, _h, _col)
}

// Surface
var _surface = surface_create(64, 64)

surface_set_target(_surface)
draw_triangle(32, 0, 64, 64, 0, 64, false)
surface_reset_target()

texer_add_surface("default", "surf#Triangle", _surface)

// Tilesets
tilesSprite = texer_add_sprite("default", "tilesSprite", sTexerDemoTiles)
tilesExtra = texer_add_sprite("default", "tilesExtra", sTexerDemoTilesExt)

// Add a tilegroup
tilegroup_add(tilegroupMain, tilesSprite, tilesExtra)
texer_add_tilegroup("default", "tilegroupMain", tilegroupMain)

// Finish batch
texer_finish_batch("default")

// Free surfaces
surface_free(_surface)

show_debug_message(tilegroup_get_first(tilegroupMain, tilesSprite))
