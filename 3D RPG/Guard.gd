extends KinematicBody
var vel : Vector3 = Vector3(-1,0,0)
var gravity : float = 12.0

var get_up_rat_voice = preload("res://Music/GuardVoice/GetUpRat.wav")

var can_speak : bool = true


func _physics_process(delta):
	vel.y -= gravity * delta
	
	if translation.x <= 1.5:
		if can_speak == true:
			$Voice.stream = get_up_rat_voice
			$Voice.playing = true
			can_speak = false
	else:
		vel = move_and_slide(vel, Vector3.UP)
