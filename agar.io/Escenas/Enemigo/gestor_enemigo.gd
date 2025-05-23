extends Node2D

@export var jugador: CharacterBody2D
@export var enemigo_escena: PackedScene

func _ready():
	for i in range(10):
		var enemigo = enemigo_escena.instantiate()
		enemigo.position = Vector2(randf_range(100, 3000), randf_range(100, 2300))
		add_child(enemigo)

func _process(delta):
	if is_instance_valid(jugador):
		for enemigo in get_children():
			if enemigo is CharacterBody2D:
				enemigo.establecer_objetivo(jugador.global_position)
	var enemigos_restantes = get_tree().get_nodes_in_group("enemigos").size()
	if enemigos_restantes == 0:
		get_tree().change_scene_to_file("res://Escenas/Escenas/ganar.tscn")
