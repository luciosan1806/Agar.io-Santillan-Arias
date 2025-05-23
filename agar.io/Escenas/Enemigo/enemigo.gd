extends CharacterBody2D

const VELOCIDAD = 150
var objetivo = Vector2.ZERO

func _ready():
	$Area2D.connect("area_entered", _on_area_entered)
	add_to_group("enemigos")
	scale.x = 2
	scale.y = 2


func _process(delta):
	if objetivo != Vector2.ZERO:
		var direccion = (objetivo - global_position).normalized()
		velocity = direccion * VELOCIDAD / scale.x
		move_and_slide()

func establecer_objetivo(nueva_posicion):
	objetivo = nueva_posicion


func _on_area_entered(area):
	var jugador = area.get_parent()
	if jugador.is_in_group("jugador"):
		if scale.x > jugador.scale.x:
			jugador.queue_free()
		else:
			jugador.scale += Vector2(0.1, 0.1)
			queue_free()
