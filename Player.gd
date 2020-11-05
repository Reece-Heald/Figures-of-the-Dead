extends KinematicBody2D

	
onready var ui = get_node("/root/Main/UserInterface/UI")
onready var inventory = get_node("/root/Main/UserInterface/Inventory")
onready var player_texture = get_node("/root/Main/Player/Player_Sprite")


export var Bullet: PackedScene 

var _speed := 155
var bullet_speed = 1000
var fire_rate = 0.2
var max_health = 5
var gun_damage = 1
var velocity = Vector2()
var can_fire = true
var curHp = max_health
var curItem = PlayerInventory.inventory.get(0)

func _process(delta):	
	ui.update_gold_text(GameState.get_money())
	if Input.is_action_just_pressed("shooting"):
		var new_bullet = Bullet.instance()
		new_bullet.position = $"Gun Position".global_position
		new_bullet.rotation_degrees = self.rotation_degrees
		new_bullet.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation))
		self.get_parent().add_child(new_bullet)
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true
	#curItem = PlayerInventory.inventory.get(0)
	#player_texture.texture = load("res://FOTD Assets/PNG/Player/Player_Weapons/" + curItem[0] + "/" + curItem[0] +".png")

	
	
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
	
	if(Input.is_action_just_pressed("inventory")):
		inventory.visible = !inventory.visible
		inventory.initialize_inventory()
	
func take_damage (dmgToTake):
	curHp -= dmgToTake
	ui.update_health_bar(curHp, max_health)
	
	if curHp <= 0:
		die()
		
func die ():
	#get_tree().reload_current_scene()
	GameState.is_game_over = true
	
func _ready ():
	ui.update_health_bar(curHp, max_health)
	
	
func set_fire_rate (amount):
	fire_rate = amount
	
func set_bullet_speed (amount):
	bullet_speed = amount
	
func set_gun_damage (amount):
	gun_damage = amount
