extends CharacterBody2D

const velocidadInicial = 200

func _ready():
	$Area2D.connect("area_entered", _on_area_entered)
	add_to_group("jugador")
	if Global.personaje_seleccionado:
		$Sprite2D.texture = load(Global.personaje_seleccionado) 


func _process(delta):
	var objetivo = get_global_mouse_position()
	var direccion = (objetivo - global_position).normalized()
	
	var escala = scale.x
	var velocidadReal = velocidadInicial/escala
	
	velocity = direccion * velocidadReal
	move_and_slide()
	
func _on_area_entered(area):
	print("colisionnnnnn")
	var enemigo = area.get_parent()
	if enemigo.is_in_group("enemigos"):
		if enemigo.scale.x > scale.x:
			queue_free()
			get_tree().change_scene_to_file("res://Escenas/Escenas/perdida.tscn")
		else:
			scale += Vector2(0.1, 0.1)
			enemigo.queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("pinchos"):
		get_tree().change_scene_to_file("res://Escenas/Escenas/perdida.tscn")
		queue_free()
