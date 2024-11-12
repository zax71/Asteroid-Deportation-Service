extends Node

var earth_health = 100
var difficulty = 0



func remove_health(remove_amount: int):
	$"../HUD".set_health($"../HUD".get_health()-remove_amount)
	earth_health = earth_health - remove_amount
	
func increment_difficulty():
	
	difficulty = difficulty + 1


func _on_ready():
	$"../HUD".set_health(100)
