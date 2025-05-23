extends TextureButton

@export var level_number: String = "1"

@onready var hover_anim: AnimationPlayer = $HoverAnim
@onready var level_label: Label = $MC/VBC/LevelLabel


func _ready() -> void:
	level_label.text = level_number

func _on_mouse_entered() -> void:
	hover_anim.play("hover_in")


func _on_mouse_exited() -> void:
	hover_anim.play("hover_out")


func _on_pressed() -> void:
	GameManager.level_selected = level_number
	get_tree().change_scene_to_file("res://scenes/levels/level_%s.tscn" % level_number)
