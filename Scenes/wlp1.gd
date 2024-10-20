extends Label

var localGametime = Global.gametime
@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = localGametime
	print(timer.wait_time)
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	print(timer.time_left)

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://finalEndScreen.tscn")
