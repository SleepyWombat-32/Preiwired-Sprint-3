extends KinematicBody

# Stats
var ammo = 100
var can_shoot : bool = false


# physics
var sprintSpeed : float = 10.0
var moveSpeed : float = 5.0
var jumpForce : float = 6.0
var gravity : float = 12.0

# cam look
var minLookAngle : float = -85.0
var maxLookAngle : float = 85.0
var lookSensitivity : float = 10.0
onready var bulletScene = preload("res://Entitys/Bullet/Bullet.tscn")
# vectors
var vel : Vector3 = Vector3()
var mouseDelta : Vector2 = Vector2()

# components
onready var camera : Camera = get_node("Camera")

func _ready():
	if !can_shoot:
		$Camera/ShotGun.hide()
	# hide and lock mouse
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):

	# reset x and z vel
	vel.x = 0
	vel.z = 0
	
	var input = Vector2()
	
	# movement inputs
	if Input.is_action_pressed("move_forward"):
		input.y -= 1
	if Input.is_action_pressed("move_backward"):
		input.y += 1
	if Input.is_action_pressed("move_left"):
		input.x -= 1
	if Input.is_action_pressed("move_right"):
		input.x += 1
	if Input.is_action_pressed("ui_end"):
		get_tree().quit()
	input = input.normalized()
	
	var forward = global_transform.basis.z
	var right = global_transform.basis.x
	
	var relativeDir = (forward * input.y + right * input.x)
	
	# set vel
	if Input.is_action_pressed("sprint"):
		vel.x = relativeDir.x * sprintSpeed
		vel.z = relativeDir.z * sprintSpeed
	else:
		vel.x = relativeDir.x * moveSpeed
		vel.z = relativeDir.z * moveSpeed
	
	# apply gravity
	vel.y -=gravity * delta
	
	# move the Player
	vel = move_and_slide(vel, Vector3.UP)
	
	# jumping
	if Input.is_action_pressed("jump") and is_on_floor():
		vel.y = jumpForce
func _process(delta):
	
	# rotate cam x axis
	camera.rotation_degrees.x -= mouseDelta.y * lookSensitivity * delta
	
	# camra clamp on x axis
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x , minLookAngle, maxLookAngle) 
	
	# rotate Player on y axis
	rotation_degrees.y -= mouseDelta.x * lookSensitivity * delta
func _input(event):
	if Input.is_action_pressed("shoot") and ammo > 0:
		if can_shoot:
			shoot()
	#reset the mouse delta vector
	mouseDelta = Vector2()
	if event is InputEventMouseMotion:
		mouseDelta = event.relative
	
func shoot():
	var bullet = bulletScene.instance()
	get_node("/root/StartingArea").add_child(bullet)
	
	bullet.global_transform = $Camera/Muzzle.global_transform
	
	ammo -= 1

func teleport(pos, rotate):
	rotation_degrees.y = rotate
	translation = pos
func take_damage(damage):
	Globals.player_health -= damage
	if Globals.player_health <= 0:
		get_tree().quit()
func get_player():
	return self
func can_now_shoot():
	can_shoot = true
	$Camera/ShotGun.show()
