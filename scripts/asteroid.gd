extends RigidBody2D

@onready var sprite = $AnimatedSprite2D

func _on_body_entered(body):
	if body.name == "Earth":
		sprite.play("Explode")
		await sprite.animation_finished
		## await get_tree().create_timer(0.5).timeout
		self.queue_free()

