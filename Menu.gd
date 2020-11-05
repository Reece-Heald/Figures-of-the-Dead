extends Control


func _on_Button2_pressed():
	print("test2")
	$Credits.show()


func _process(delta):
	if self.visible == true:
		get_tree().paused = true
	else:
		get_tree().paused = false

func _on_Button3_pressed():
	get_tree().quit()


func _on_Button_pressed():
	GameState.start_game()
	if GameState.is_game_started:
		
		self.visible = false
