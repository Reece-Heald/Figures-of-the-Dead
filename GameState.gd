extends Node

var money: int = 110

var store = {
			'bought' : [true, false, false],
			'selected': 0,
}
var save_store_path = 'user://save'

var is_game_over: bool = false

var is_game_paused: bool = false

var is_game_started: bool = false

var is_game_shop = false

var is_player_dead = false

var is_double_points = false

var is_map_selected = false

var current_map

func increase_score(amount: int) -> void:
	money+=amount
	
func start_game_over() -> void:
	is_game_over = true
	
func start_game_pause() -> void:
	is_game_paused = true
	
func start_game_shop():
	is_game_shop = true
	
func start_game():
	is_game_started = true
	
	
func get_money() -> int:
	return money
	
func start_double_points():
	is_double_points = true
	
func end_double_points():
	is_double_points = false
func save_store():
	var file = File.new()
	file.open(save_store_path, file.WRITE_READ)
	file.store_var(store)
	file.close()

func load_store():
	var file = File.new()
	if not file.file_exists(save_store_path):
		return false
	file.open(save_store_path, file.READ)
	store = file.get_var()
	file.close()
	return true
func set_map(map: String):
	current_map = map
	print(map)
func get_map():
	return current_map
	
