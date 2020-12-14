extends Node2D
var is_timer_on = false

func _on_Area2D_area_entered(body):
	print("picked up power up")
	GameState.is_double_points = true
	queue_free()
	$Timer.start()

	

func _on_Timer_timeout():
	print("timer test")
	GameState.is_double_points = false
	GameState.end_double_points()
	is_timer_on = false

func _on_Area2D_area_exited(area):
	pass
