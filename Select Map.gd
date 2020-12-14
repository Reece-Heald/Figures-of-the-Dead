extends TextureRect


var is_map2 = false
var is_map3 = false
var is_map1 = false

func _on_Button3_pressed():
	print("test1")
	self.hide()
	


func _on_Button_pressed():
	GameState.set_map("Map1")
	GameState.current_map = "Map1"
	is_map1 = true
	is_map2 = false
	is_map3 = false
	GameState.is_map_selected = true
	$Button.text = "Selected"
	$Button2.text = "Select"
	$Button4.text = "Select"
	print("current map = " + GameState.current_map)


func _on_Button2_pressed():
	GameState.set_map("Map2")
	GameState.current_map = "Map2"
	GameState.is_map_selected = true
	is_map2 = true
	is_map3 = false
	$Button.text = "Select"
	$Button2.text = "Selected"
	$Button4.text = "Select"
	print("current map = " + GameState.current_map)


func _on_Button4_pressed():
	GameState.set_map("Map3")
	GameState.current_map = "Map3"
	GameState.is_map_selected = true
	is_map3 = true
	is_map2 = false
	$Button.text = "Select"
	$Button2.text = "Select"
	$Button4.text = "Selected"
	print("current map = " + GameState.current_map)
