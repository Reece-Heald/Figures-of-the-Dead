extends ColorRect

func _process(delta):
	if GameState.is_game_over:
		self.visible = true
		get_tree().paused = true
		
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene("res://Main.tscn")
		GameState.is_game_paused = false
		GameState.is_game_over = false
		GameState.money = 0
		get_tree().paused = false
