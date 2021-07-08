extends Control

func _process(_delta):
	$Label.text = "Health : " + str(Globals.player_health)
