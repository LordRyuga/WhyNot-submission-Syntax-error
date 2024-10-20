extends Node2D
var check = 1
var respawntime = 5.0
var player_scene = preload("res://Scenes/PLAYER 2.tscn")
var player = null
var displayDeath

#var deaths2 = 0

func _ready() -> void:
	spawn_player()

func _process(delta):
	
	
	
	if player == null:
		if check == 1:
			
			Global.deathsp2 = Global.deathsp2 + 1
			check = 0
		respawntime -= delta
		if respawntime <= 0.0:
			check = 1
			spawn_player()
			respawntime = 5.0

	#text_edit.text = displayDeath
func spawn_player() -> void:
	var new_obj = player_scene.instantiate()
	new_obj.position = position
	get_parent().call_deferred("add_child", new_obj)
	player = new_obj
	
