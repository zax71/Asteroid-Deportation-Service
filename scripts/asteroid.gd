extends RigidBody2D

@onready var sprite = $AnimatedSprite2D
@onready var camera = $"../Camera2D"
@onready var earth = $earth_colision
@onready var game_manager = $"../GameManager"


var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()
	self.set_position(random_pos())

func kill():
	# Play animation
	sprite.play("Explode")
	await sprite.animation_finished
		
	
		
	# Duplicate and put in random position
	var new_asteroid = self.duplicate()
	get_parent().add_child(new_asteroid)
	new_asteroid.set_position(random_pos())
		
	# Delete this copy
	self.queue_free()

func _on_body_entered(body):
	if body.name == "Earth":
		# Remove earth health
		game_manager.remove_health(10)
		kill()
		



func random_pos() -> Vector2:
	# Get camera corner coordinates.
	var top_left: Vector2 = camera.get_screen_center_position() - camera.get_viewport_rect().size / 2 
	var bottom_right: Vector2 = camera.get_screen_center_position() + camera.get_viewport_rect().size / 2 
	
	var edge = rng.randi_range(1,4)
	var distance: float = 100.0
	
	var point: Vector2
	
	match edge:
		1: # Top
			print("On top edge")
			point = Vector2(
				rng.randf_range(top_left.x-distance, bottom_right.x+distance),
				rng.randf_range(top_left.y, top_left.y+distance)
			)
		2: # Right
			print("On right edge")
			point = Vector2(
				rng.randf_range(bottom_right.x, bottom_right.x+distance),
				rng.randf_range(top_left.y+distance, bottom_right.y-distance)
			)
		3: # Bottom
			print("On bottom edge")
			point = Vector2(
				rng.randf_range(top_left.x-distance, bottom_right.x+distance),
				rng.randf_range(bottom_right.y, bottom_right.y-distance)
			)
		4: # Left
			print("On left edge")
			point = Vector2(
				rng.randf_range(top_left.x-distance, top_left.x),
				rng.randf_range(top_left.y+distance, bottom_right.y-distance)
			)
	
	print("picked: " + str(point))
	return point

