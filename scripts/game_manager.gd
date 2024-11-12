extends Node

var earth_health = 100
var difficulty = 2



func remove_health(remove_amount: int):
	$"../HUD".set_health($"../HUD".get_health()-remove_amount)
	earth_health = earth_health - remove_amount
	
func increment_difficulty():
	difficulty = difficulty + 0.2
	print("Difficulty: " + str(difficulty))

func get_difficulty() -> int:
	return difficulty
	


func _on_ready():
	$"../HUD".set_health(100)
