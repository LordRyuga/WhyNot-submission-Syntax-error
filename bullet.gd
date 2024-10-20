extends Area2D
var speed=700

var bullet_direction
var final


	

func _process(delta):
	position -= bullet_direction * speed * delta
	pass




func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		if body.name != get_parent().name:
			body.take_damage()
