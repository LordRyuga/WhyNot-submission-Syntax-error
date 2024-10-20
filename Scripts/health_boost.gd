extends Area2D





func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("heal_boost"):
		body.heal_boost()
   
