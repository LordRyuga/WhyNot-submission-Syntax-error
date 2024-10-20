extends Node2D

var player_scene = preload("res://Scenes/character.tscn")

func spawn_player() -> void:
	var new_obj = player_scene.instantiate()
	new_obj.position = position
	get_parent().call_deferred("add_child", new_obj)
	get_tree().current_scene.player = new_obj  # Update reference to current player
