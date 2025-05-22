extends Control

@onready var level_label: Label = $MarginContainer/VBoxContainer/LevelLabel
@onready var attempts_label: Label = $MarginContainer/VBoxContainer/AttemptsLabel
@onready var vb_game_over: VBoxContainer = $MarginContainer/VBGameOver
@onready var game_over_sound: AudioStreamPlayer = $GameOverSound

var _attempt: int = -1
var _level: int = 0

func _ready() -> void:
	on_attempt_made()
	_level = 1
	level_label.text = "Level   %s" % _level

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("exit"):
		GameManager.load_main_scene()
	elif vb_game_over.visible and event.is_action_pressed("ui_accept"):
		#ScoreManager.high_score = _score
		GameManager.load_main_scene()

func _enter_tree() -> void:
	SignalHub.on_attempt_made.connect(on_attempt_made)
	SignalHub.on_cup_die.connect(on_cup_die) 

func on_attempt_made() -> void:
	_attempt += 1
	attempts_label.text = "Attempt   %s " % _attempt

func on_level_complete() -> void:
	vb_game_over.show()
	_level += 1

func on_cup_die(remaining_cups: int) -> void:
	if remaining_cups == 0:
		vb_game_over.show()
		game_over_sound.play()
	
