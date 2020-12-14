extends Control
var click = AudioStreamPlayer.new();
var main = preload("res://Main.tscn").instance()
var map2 = preload("res://Map2.tscn").instance()
var map3 = preload("res://Map3.tscn").instance()
var middle = Rect2(Vector2(349.491, 235.99),Vector2(331, 207))

var current_map = GameState.get_map()

func _on_Button2_pressed():
	self.add_child(click);
	click.stream = load("res://FOTD Assets/Sounds/Buttons/button.wav");
	click.play(true);
	$Credits.show()


func _process(delta):
	if self.visible == true:
		get_tree().paused = true
	else:
		get_tree().paused = false

func _on_Button3_pressed():
	self.add_child(click);
	click.stream = load("res://FOTD Assets/Sounds/Buttons/button.wav");
	click.play(true);
	get_tree().quit()


func _on_Button_pressed():
	self.add_child(click);
	click.stream = load("res://FOTD Assets/Sounds/Buttons/button.wav");
	click.play(true);
	
	if GameState.is_map_selected == true:
		if $"Select Map".is_map2 == true:
			print("map 2 test")
			get_tree().get_root().add_child(map2)
			queue_free()
		elif $"Select Map".is_map3 == true:
			print("map 3 test")
			get_tree().get_root().add_child(map3)
			queue_free()
		elif $"Select Map".is_map1 == true:
			print("map 1 test")
			get_tree().get_root().add_child(main)
			queue_free()
		GameState.start_game()
		if GameState.is_game_started:
			self.visible = false
		
	else:
		print("popup error")
		#$Popup.popup_centered(middle)
		$Popup.popup(middle)
		
	

func _on_Button4_pressed():
	self.add_child(click);
	click.stream = load("res://FOTD Assets/Sounds/Buttons/button.wav");
	click.play(true);
	$"Select Map".show()
	

