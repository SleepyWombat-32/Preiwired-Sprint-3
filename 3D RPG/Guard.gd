extends KinematicBody
var vel : Vector3 = Vector3(-1,0,0)
var gravity : float = 12.0


var can_speak : bool = true


func _physics_process(delta):
	vel.y -= gravity * delta
	
	if translation.x <= 1.5:
		if can_speak == true:
			print ("Get up rat, time for testing")
			can_speak = false
	else:
		vel = move_and_slide(vel, Vector3.UP)
