extends KinematicBody
var wait
# stats
var health : int = 5 
export (float) var moveSpeed = 2
var gravity : float = 12.0
# attacking
var damage : int = 4
var attackRate : float = 1.0
var attackDist : float = 5.0

var velocity : Vector3


export (int) var time_until_attack = 10
export (bool) var area_entered_to_attack = false

# components
onready var player : Node = get_node ("/root/StartingArea/Player")
onready var timer : Timer = get_node ("Timer")


func _ready():
	set_physics_process(false)
	if area_entered_to_attack == false:
		$WaitTimer.wait_time = time_until_attack
		$WaitTimer.start()
func _physics_process(delta):
	
	# find the player
	var dir = (player.translation - translation).normalized()
	dir.y = 0
	
	# move to player
	if translation.distance_to(player.translation) > attackDist:
		velocity = dir * moveSpeed
		velocity.y -= gravity * delta
		var _u = move_and_slide(velocity, Vector3.UP)
func take_damage(damage_to_deal):
	
	health -= damage_to_deal
	
	if health <= 0:
		die()
		
func die():
	Globals.baddies_killed += 1
	queue_free()



func attack():
	get_tree().call_group("Player", "take_damage", damage)
	

func _on_Timer_timeout():
	if translation.distance_to(player.translation) <= attackDist:
		attack()
func on_WaitTimer_timeout():
	set_physics_process(true)
	# setup timer
	timer.set_wait_time(attackRate)
	timer.start()
