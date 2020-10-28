extends Control



onready var healthBar : TextureProgress = get_node("Health_Box/Health_Bar")

func update_health_bar (curHp, maxHp):
 
	healthBar.value = (100 / maxHp) * curHp
