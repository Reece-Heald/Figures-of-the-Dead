extends Node2D

export var _enemy_scene: PackedScene



func spawn_enemy() -> void:
	var postion_x =  $"Zombies_Spawn_Position".position.x
	var postion_y =  $"Zombies_Spawn_Position".position.y
	var new_enemy = _enemy_scene.instance() as Node2D
	self.add_child(new_enemy)
	new_enemy.position = Vector2(postion_x, postion_y)
	#new_enemy.position = Vector2(global_position.x, global_position.y)
