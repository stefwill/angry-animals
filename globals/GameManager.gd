extends Node

const LEVEL_BASE = preload("res://scenes/level-base.tscn")
const MAIN = preload("res://scenes/main.tscn")

var next_scene: PackedScene

func load_game_scene() -> void:
	next_scene = LEVEL_BASE
	
func load_main_scene() -> void:
	next_scene = MAIN
