extends Node

signal on_animal_died
signal on_cup_die(remaining_cups: int)
signal on_attempt_made
signal on_level_complete

func emit_on_animal_died() -> void:
	on_animal_died.emit()

func emit_on_cup_die(remaining_cups: int) -> void:
	on_cup_die.emit(remaining_cups)

func emit_on_attempt_made() -> void:
	on_attempt_made.emit()

func emit_on_level_complete() -> void:
	on_level_complete.emit()
