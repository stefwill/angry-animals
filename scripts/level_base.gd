extends Node2D

const ANIMAL = preload("res://scenes/animal.tscn")
const MAIN = preload("res://scenes/main.tscn")

@onready var spawn_piont: Marker2D = $SpawnPiont


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		get_tree().change_scene_to_packed(MAIN)
		

func _ready() -> void:
	spawn_animal()

func _enter_tree() -> void:
	SignalHub.on_animal_died.connect(spawn_animal)

func spawn_animal() -> void:
	var new_animal: Animal = ANIMAL.instantiate()
	new_animal.position = spawn_piont.position
	add_child(new_animal)
