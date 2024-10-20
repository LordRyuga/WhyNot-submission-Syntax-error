extends Label
@onready var timer: Timer = $Timer

var localGametime = Global.gametime
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = localGametime
	timer.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_timer_timeout() -> void:
	print(localGametime)
	get_tree().change_scene_to_file("res://finalEndScreen.tscn")
