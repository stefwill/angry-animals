extends Node

const MAIN = preload("res://scenes/main.tscn")

var next_scene: PackedScene
var level_selected: String = "1":
	get:
		return level_selected
	set(value):
		level_selected = value

	
func load_main_scene() -> void:
	next_scene = MAIN
