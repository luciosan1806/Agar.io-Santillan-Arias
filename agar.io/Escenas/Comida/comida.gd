extends Area2D

func _on_body_entered(body):
	if body.is_in_group("jugador") or body.is_in_group("enemigos"):
		body.scale += Vector2(0.1, 0.1)
		queue_free()
