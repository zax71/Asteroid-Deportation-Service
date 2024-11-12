extends Area2D

var dead = false
var mouse_on: bool = false
func _on_mouse_entered():
	print("Mouse entered")
	mouse_on = true

func _on_mouse_exited():
	print("Mouse exited")
	mouse_on = false

func _process(delta):
	if Input.is_action_just_pressed("select") and mouse_on and (not dead):
		print("Killing")
		dead = true
		$"..".kill()
