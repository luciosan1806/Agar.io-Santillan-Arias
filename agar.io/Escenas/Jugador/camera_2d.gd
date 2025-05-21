extends Camera2D

@export var jugador: CharacterBody2D

const ZOOM_BASE = Vector2(1, 1)
const ESCALA_MINIMA = 1.0
const FACTOR_ZOOM = 0.07

func _process(delta):
	global_position = get_parent().global_position 
	if jugador:
		var escala = jugador.scale.x
		zoom = ZOOM_BASE - Vector2(FACTOR_ZOOM * (escala - ESCALA_MINIMA), FACTOR_ZOOM * (escala - ESCALA_MINIMA))
