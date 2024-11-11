extends Node

var earth_health = 100
var difficulty = 0

func remove_health(remove_amount: int):
	earth_health = earth_health - remove_amount
	
func increment_difficulty():
	difficulty = difficulty + 1
