extends Label

var localGametime = Global.gametime

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.rotation_degrees = 0.0
	localGametime -= delta
	if localGametime < 0.05:
		get_tree().change_scene_to_file("res://finalEndScreen.tscn")
	
