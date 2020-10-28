extends KinematicBody2D

	
onready var ui = get_node("/root/Main/CanvasLayer/UI")


export var Bullet: PackedScene 


export var _speed := 155
export var bullet_speed = 1000
export var fire_rate = 0.2
export var max_health = 5
var gun_damage = 1
var velocity = Vector2()
var can_fire = true
var curHp = max_health

func _process(delta):	
	if Input.is_action_just_pressed("shooting"):
		var new_bullet = Bullet.instance()
		new_bullet.position = $"Gun Position".global_position
		new_bullet.rotation_degrees = self.rotation_degrees
		new_bullet.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		self.get_parent().add_child(new_bullet)
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true

func _physics_process(delta):	
	look_at(get_global_mouse_position())
	get_input()
	velocity = move_and_slide(velocity)
	


	

func get_input():
	
	velocity = Vector2()
	if(Input.is_action_pressed("move_right")):
		velocity.x += _speed
	if(Input.is_action_pressed("move_left")):
		velocity.x -= _speed
	if(Input.is_action_pressed("move_up")):
		velocity.y -= _speed
	if(Input.is_action_pressed("move_down")):
		velocity.y += _speed
		
	velocity = velocity.normalized() * _speed
	
	
func take_damage (dmgToTake):
	curHp -= dmgToTake
	ui.update_health_bar(curHp, max_health)
 
	if curHp <= 0:
		die()
 
func die ():
	get_tree().reload_current_scene()

func _ready ():
	ui.update_health_bar(curHp, max_health)
