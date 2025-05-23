extends StaticBody2D

class_name Cup

static var _num_cups: int = 0

@onready var vanish_animation: AnimationPlayer = $VanishAnimation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_num_cups += 1

func die() -> void:
	vanish_animation.play("vanish")

func _on_vanish_animation_animation_finished(_anim_name: StringName) -> void:
	_num_cups -= 1
	SignalHub.emit_on_cup_die(_num_cups)
	if _num_cups == 0:
		SignalHub.emit_on_level_complete()
	queue_free()
