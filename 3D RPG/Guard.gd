extends KinematicBody
# A walking talking guard, this script contains all of the guards movement and talking script

var m_1_vel : Vector3 = Vector3(-2, 0, 0)
var m_2_vel : Vector3 = Vector3(2, 0, 0)
var gravity : float = 12.0

var get_up_rat_voice = preload("res://Music/GuardVoice/GetUpRat.wav")
var follow_me_voice = "nothing here yet"

var can_speak : bool = true

var move : int = 1
func _physics_process(delta):
	if move == 1:
		m_1_vel.y -= gravity * delta
		move_1()
	if move == 2:
		m_2_vel.y -= gravity * delta
		move_2()

func move_2():
	if translation.x >= 20:
		yield(get_tree().create_timer(2),"timeout")
		print("guard is at 2nd location")
		move = 3
	else:
		m_2_vel = move_and_slide(m_2_vel, Vector3.UP)



func move_1():
	if translation.x <= 1.5:
		if can_speak == true:
			$Voice.stream = get_up_rat_voice
			$Voice.playing = true
			get_tree().call_group("NPC","change_text", "Get up rat, it's time for testing", 3)
			can_speak = false
			yield(get_tree().create_timer(3),"timeout")
			$Voice.stream = get_up_rat_voice
			$Voice.playing = true
			get_tree().call_group("NPC","change_text", "Follow me", 5)
			move = 2
	else:
		m_1_vel = move_and_slide(m_1_vel, Vector3.UP)
