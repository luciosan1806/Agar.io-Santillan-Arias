extends CharacterBody2D

const velocidadInicial = 200

func _ready():
	$Area2D.connect("area_entered", _on_area_entered)
	add_to_group("jugador")


func _process(delta):
	var objetivo = get_global_mouse_position()
	var direccion = (objetivo - global_position).normalized()
	
	var escala = scale.x
	var velocidadReal = velocidadInicial/escala
	
	velocity = direccion * velocidadReal
	move_and_slide()
	
func _on_area_entered(area):
	var enemigo = area.get_parent()  # Obtiene el nodo padre (enemigo)
	if enemigo.is_in_group("enemigos"):
		if enemigo.scale.x > scale.x:  # Si el enemigo es más grande, el jugador pierde
			queue_free()
		else:  # Si el jugador es más grande, come al enemigo
			scale += Vector2(0.1, 0.1)
			enemigo.queue_free()
