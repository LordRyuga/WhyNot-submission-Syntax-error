extends Node2D

var respawntime = 5.0
var player_scene = preload("res://Scenes/character.tscn")
var player = null
var deaths = 0
var check = 1
func _ready() -> void:
	spawn_player()

func _process(delta):
	if player == null:
		if check == 1:
			deaths = deaths + 1
			check = 0
		respawntime -= delta
		if respawntime <= 0.0:
			spawn_player()
			check = 1
			respawntime = 5.0

func spawn_player() -> void:
	var new_obj = player_scene.instantiate()
	new_obj.position = position
	get_parent().call_deferred("add_child", new_obj)
	player = new_obj
