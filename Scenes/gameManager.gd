extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var pause_play: Button = $pause_play

func _ready() -> void:
	Global.deathsp1 = 0
	Global.deathsp2 = 0




func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused:
			get_tree().paused = false
		else:
			get_tree().paused = true

func _on_pause_play_pressed() -> void:
	if get_tree().paused:
		get_tree().paused = false
	else:
		get_tree().paused = true
