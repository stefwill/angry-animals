extends Node2D

const ANIMAL = preload("res://scenes/animal.tscn")

@onready var spawn_piont: Marker2D = $SpawnPiont

var lives: int = 0

func _ready() -> void:
	spawn_animal()

func _enter_tree() -> void:
	SignalHub.on_animal_died.connect(spawn_animal)

func spawn_animal() -> void:
	var new_animal: Animal = ANIMAL.instantiate()
	new_animal.position = spawn_piont.position
	add_child(new_animal)
	lives = lives + 1
	print(lives)


func _on_timer_timeout() -> void:
	spawn_animal()
