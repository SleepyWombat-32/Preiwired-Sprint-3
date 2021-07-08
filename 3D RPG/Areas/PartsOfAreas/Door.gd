extends StaticBody
export (String, "Player", "Guard", "Both") var open_type = "Both"
func _on_DoorOpenArea_body_entered(body):
	if open_type == "Player" || open_type == "Both":
		if body.name == "Player":
			get_tree().queue_delete($DoorInside)
			get_tree().queue_delete($CollisionShape)
	if open_type == "Guard" || open_type == "Both":
		if body.name == "Guard":
			get_tree().queue_delete($DoorInside)
			get_tree().queue_delete($CollisionShape)
