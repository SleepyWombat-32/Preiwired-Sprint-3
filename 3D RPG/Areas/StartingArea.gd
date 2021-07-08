extends Spatial


func _on_GuardFight1StartArea_body_entered(body):
	if body.name == "Player":
		get_tree().call_group("Player", "can_now_shoot")
