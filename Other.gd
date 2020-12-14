extends Tabs



onready var price1 = str2var($RichTextLabel/Control/Panel/PriceLabel.text)
onready var panel1 = get_node("/root/Main/UserInterface/Shop/TabContainer/Guns/RichTextLabel/Control/Button")
onready var price2 = str2var($RichTextLabel/Control/Panel2/PriceLabel.text)
onready var panel2 = get_node("/root/Main/UserInterface/Shop/TabContainer/Guns/RichTextLabel/Control/Button2")
onready var inventory = get_node("/root/Main/UserInterface/Inventory")
onready var inventory_slots = get_tree().get_root().get_node("/root/Main/UserInterface/Inventory/Background/GridContainer")
onready var player = get_node("/root/Main/Player")
var slots = preload("res://Slot.gd")

var ItemClass = preload("res://Item.tscn")
var item = null



func buy(price, item_no):
	
	GameState.load_store()
	if price == 100:
		if GameState.money >= price:
			GameState.money -= price
			GameState.store.bought[item_no] = true
			#GameState.save_store()
			panel1.text = "Bought"
			player.heal(1)
			print("-----------------")
		else:
			var rem = price - GameState.money
			$Remainder/Label.text = 'You need '+str(rem)+' money \nto buy this'
			$Remainder.show()
			
	if price == 110:
		if GameState.money >= price:
			GameState.money -= price
			GameState.store.bought[item_no] = true
			#GameState.save_store()
			panel1.text = "Bought"
			print(player.get_speed())
			player.test()
			player.increase_speed(45)
			print("SPPEEDDD")
			print("-----------------")
			print(player.get_speed())
			player.test()
		else:
			var rem = price - GameState.money
			$Remainder/Label.text = 'You need '+str(rem)+' money \nto buy this'
			$Remainder.show()
func _on_Ok_Button_pressed():
	$Remainder.hide()
	
func _ready():

	GameState.load_store()

func _on_Button_pressed():
	buy(price1, 0)


func _on_Button2_pressed():
	buy(price2, 1)
