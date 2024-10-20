extends Control

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	if Global.deathsp1 > Global.deathsp2:
		label.text = "Player 2 Wins\nKills : " + str(Global.deathsp1) + "\n" + "Deaths : " + str(Global.deathsp2)
	elif Global.deathsp1 == Global.deathsp2:
		label.text = "DRAW!!\n AMAZING!?"
	else:
		label.text = "Player 1 Wins\nKills : " + str(Global.deathsp2) + "\n" + "Deaths : " + str(Global.deathsp1)


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
