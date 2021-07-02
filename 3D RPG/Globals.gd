extends Node
# Globals, the place to store global varables (like gravity)
# and global actions (like quiting the game)


func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()
