extends TextureButton

@onready var hover_anim: AnimationPlayer = $HoverAnim

func _on_mouse_entered() -> void:
	hover_anim.play("hover_in")


func _on_mouse_exited() -> void:
	hover_anim.play("hover_out")
