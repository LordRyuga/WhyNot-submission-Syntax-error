extends Label

@onready var label: Label = $"."



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = "Kills : " + str(Global.deathsp1)
