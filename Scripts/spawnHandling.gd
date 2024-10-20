extends Node2D

var respawntime = 5.0
var player_scene = preload("res://Scenes/character.tscn")
var player = null

func _ready() -> void:
	randomize()  # Ensure randomness for spawner selection
	spawn_player_at_random_spawner()

func _process(delta):
	if player == null:
		respawntime -= delta
		if respawntime <= 0.0:
			spawn_player_at_random_spawner()
			respawntime = 5.0

func spawn_player_at_random_spawner() -> void:
	var spawners = get_tree().get_nodes_in_group("Spawners")
	if spawners.size() > 0:
		var random_spawner = spawners[randi() % spawners.size()]
		random_spawner.spawn_player()

# Note: This script is on the player spawner node.
