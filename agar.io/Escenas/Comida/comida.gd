extends Area2D

func _on_body_entered(body):
	if body.name == "Jugador":
		body.scale += Vector2(0.1, 0.1)
		queue_free()
