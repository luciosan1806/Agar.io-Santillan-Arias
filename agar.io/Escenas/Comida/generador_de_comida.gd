extends Node2D

const COMIDA = preload("res://Escenas/Comida/comida.tscn")

func _ready():
	for i in range(300):
		var nueva_comida = COMIDA.instantiate()
		nueva_comida.position = Vector2(randf_range(0, 4042), randf_range(0, 2694))
		add_child(nueva_comida)
