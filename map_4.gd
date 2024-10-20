extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


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
