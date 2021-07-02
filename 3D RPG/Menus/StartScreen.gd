extends Control
# The script for the start menu, contains the buttons scripts


func _on_StartButton_pressed():
	var _u = get_tree().change_scene("res://Areas/StartingArea.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()
