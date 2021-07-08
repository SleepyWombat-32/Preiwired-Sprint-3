extends Node
# Globals, the place to store global varables (like gravity)
# and global actions (like quiting the game)
var muted : bool = false
var player_max_health : int = 100
var player_health : int = player_max_health
var baddies_killed : int = 0
func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()
	if event.is_action_pressed("mute"):
		if muted == false:
			muted = true
			AudioServer.set_bus_mute(0, true)
		else:
			muted = false
			AudioServer.set_bus_mute(0, false)
func _process(delta):
	if baddies_killed == 4:
		pass
