extends AudioStreamPlayer
# Background music, handles the music played in the main part of the game 

func _ready(): 
	$AnimationPlayer.play("FadeIn")
