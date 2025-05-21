extends CharacterBody2D

const velocidadInicial = 200

func _process(delta):
	var objetivo = get_global_mouse_position()
	var direccion = (objetivo - global_position).normalized()
	
	var escala = scale.x
	var velocidadReal = velocidadInicial/escala
	
	velocity = direccion * velocidadReal
	move_and_slide()
