extends RigidBody2D

@onready var sprite = $AnimatedSprite2D

var rng = RandomNumberGenerator.new()
func _ready():
	self.set_position(Vector2(rng.randi_range(-200, 200), rng.randi_range(-200, 200)))

func _on_body_entered(body):
	if body.name == "Earth":
		sprite.play("Explode")
		await sprite.animation_finished
		var new_asteroid = self.duplicate()
		get_parent().add_child(new_asteroid)
		new_asteroid.set_position(Vector2(rng.randi_range(-200, 200), rng.randi_range(-200, 200)))
