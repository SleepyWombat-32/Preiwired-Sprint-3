extends Control



func _on_QuitButton_pressed():
	get_tree().quit()


func _on_PlayerAgainButton_pressed():
	Globals.player_health = Globals.player_max_health
	Globals.baddies_killed = 0
	SceneChanger.change_scene("res://Areas/StartingArea.tscn")
