extends Control

@export var personajes: Array[TextureButton]

func _ready():
	for boton in personajes:
		boton.connect("pressed", _on_personaje_seleccionado.bind(boton))

func _on_personaje_seleccionado(boton):
	Global.personaje_seleccionado = boton.texture_normal.resource_path
	get_tree().change_scene_to_file("res://Escenas/Juego/juego.tscn")
