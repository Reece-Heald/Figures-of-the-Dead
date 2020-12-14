extends Popup

func _input(event):
	if event is InputEventKey:
		if Input.is_action_pressed("close"):
			close()


func close():
	get_tree().paused = false
	hide()
	
