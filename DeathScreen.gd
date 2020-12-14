extends ColorRect

onready var mainmenu = get_node("res://MainMenu.tscn")



func _process(delta):
	if GameState.is_game_over:
		self.visible = true
		get_tree().paused = true
	else:
		get_tree().paused = false

func _on_Button_pressed():
	
	#get_tree().change_scene("res://MainMenu.tscn")
	#queue_free()
	#get_tree().get_root().add_child(mainmenu)
	GameState.is_game_paused = false
	GameState.is_game_over = false
	GameState.money = 0
	#get_tree().paused = false
	get_tree().quit()
	
