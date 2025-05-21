extends Node2D

const COMIDA = preload("res://Escenas/Comida/comida.tscn")

func _ready():
	for i in range(10):
		var nueva_comida = COMIDA.instantiate()
		nueva_comida.position = Vector2(randf_range(100, 900), randf_range(100, 600))
		add_child(nueva_comida)
