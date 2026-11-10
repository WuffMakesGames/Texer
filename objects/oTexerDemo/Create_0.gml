/// @description 

randomize()

// Variables
atlas = texer_create_atlas("default", 512)
tilegroupMain = texer_create_tilegroup(16, 16)

// Begin batch
texer_start_batch(atlas)

// Add a bunch of quads
for (var _i = 0; _i < 50; _i++) {
	var _w = random_range(25,100)
	var _h = random_range(25,100)
	var _col = make_colour_rgb(random(255), random(255), random(255))
	texer_add_quad(atlas, $"quad#{_i}", _w, _h, _col)
}

// Surface
var _surface = surface_create(64, 64)

surface_set_target(_surface)
draw_triangle(32, 0, 64, 64, 0, 64, false)
surface_reset_target()

texer_add_surface(atlas, "surf#Triangle", _surface)

// Sprites
texer_add_sprite(atlas, "missingSprite#1", sTexerMissing)
texer_add_sprite(atlas, "missingSprite#2", sTexerMissing)
texer_add_sprite(atlas, "missingSprite#3", sTexerMissing)
texer_add_sprite(atlas, "missingSprite#4", sTexerMissing)

// Tilesets
tilesGrass = texer_add_quad(atlas, "tilesGrass", 64, 128, c_green)
tilesDesert = texer_add_quad(atlas, "tilesDesert", 64, 16, c_orange)
tilesSprite = texer_add_sprite(atlas, "tilesSprite", sTexerDemoTiles)

// Add a tilegroup
tilegroup = texer_add_tilegroup(atlas, "tilegroupMain", tilegroupMain)
tilegroup_add(tilegroup, tilesGrass, tilesDesert, tilesSprite)

// Finish batch
texer_finish_batch(atlas)

// Free surfaces
surface_free(_surface)
