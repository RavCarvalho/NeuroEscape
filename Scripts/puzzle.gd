extends Area2D

var tiles = []
var solved_positions = {}
var empty_tile = null

func _ready():
	start_game()

func start_game():
	tiles = get_node("Tiles").get_children()
	save_solved_positions()
	empty_tile = find_empty_tile()
	shuffle_tiles()

func save_solved_positions():
	for tile in tiles:
		solved_positions[tile] = tile.position

func find_empty_tile():
	for tile in tiles:
		if tile.texture == null or tile.name == "Tile16":
			return tile
	return null

func shuffle_tiles():
	var previous = null
	for _i in range(350):
		var neighbors = get_neighbors(empty_tile)
		var tile = neighbors[randi() % neighbors.size()]
		swap_tiles(tile, empty_tile)
		previous = tile

func get_neighbors(tile):
	var neighbors = []
	var tile_pos = tile.position
	for t in tiles:
		if t == tile:
			continue
		if (abs(t.position.x - tile_pos.x) == 180 and t.position.y == tile_pos.y) or (abs(t.position.y - tile_pos.y) == 180 and t.position.x == tile_pos.x):
			neighbors.append(t)
	return neighbors

func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var clicked_tile = get_clicked_tile(event.position)
		if clicked_tile and clicked_tile in get_neighbors(empty_tile):
			swap_tiles(clicked_tile, empty_tile)
			if tiles_match():
				print("You win!")
				Global.puzzleterminado = true

func get_clicked_tile(mouse_pos):
	for tile in tiles:
		if tile.get_rect().has_point(mouse_pos - tile.position):
			return tile
	return null

func swap_tiles(tile1, tile2):
	var temp_pos = tile1.position
	tile1.position = tile2.position
	tile2.position = temp_pos
	empty_tile = tile2

func tiles_match():
	for tile in tiles:
		if tile.position != solved_positions[tile]:
			return false
	return true
