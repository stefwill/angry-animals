extends Node

signal on_animal_died
signal on_point_scored

func emit_on_animal_died() -> void:
	on_animal_died.emit()

func emit_on_point_scored() -> void:
	on_point_scored.emit()
