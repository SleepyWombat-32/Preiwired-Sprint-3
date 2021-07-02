extends Control



func _on_StartButton_pressed():
	$AnimationPlayer.play("FadeMusic")
	yield ($AnimationPlayer, "animation_finished")
	var _u = get_tree().change_scene("res://Areas/StartingArea.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
