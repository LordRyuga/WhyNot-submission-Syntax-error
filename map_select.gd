extends Control
var user_input_time
var inIntForm
@onready var line_edit: LineEdit = $LineEdit
@onready var button: Button = $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_map_anurag_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Map_Anurag.tscn")



func _on_map_4_pressed() -> void:
	get_tree().change_scene_to_file("res://map_4.tscn")


func _on_map_3_pressed() -> void:
	get_tree().change_scene_to_file("res://map_3.tscn")


func _on_map_2_pressed() -> void:
	get_tree().change_scene_to_file("res://map_2.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func confirm() -> void:
	user_input_time = line_edit.text
	inIntForm = user_input_time.to_int()
	Global.gametime = inIntForm
