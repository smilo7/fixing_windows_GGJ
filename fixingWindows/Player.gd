extends KinematicBody


#const MOVE_SPEED = 8
const SPRINT_SPEED = 1.05
const MAX_JUMP_TIME = 2
const MOUSE_SENS = 0.5
const MOVE_SPEED = 6
const ACCELERATION = 3
const DE_ACCELERATION = 5


onready var anim_player = $AnimationPlayer
onready var raycast = $RayCast
var gravity = -9.8
var velocity = Vector3()
var newVel = Vector3()
var rotate = 0
var jump_time = 0
var falling = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) #get mouse in centre of screen and set to 
	yield(get_tree(), "idle_frame") #wait frame
	get_tree().call_group("zombies", "set_player", self)
	


#for mouse movement
func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.x -= MOUSE_SENS * event.relative.y
		rotation_degrees.y -= MOUSE_SENS * event.relative.x
		rotate -= (MOUSE_SENS * event.relative.x) * 3.141593 / 180

func _process(delta):
	if Input.is_action_pressed("exit"):
		get_tree().quit()
	if Input.is_action_pressed("restart"):
		kill()
	 
func _physics_process(delta):
	var move_vec = Vector3()
	var speed_Modifier = 1
	
	if Input.is_action_pressed("move_forwards"):
		move_vec.z -= 1
	if Input.is_action_pressed("move_backwards"):
		move_vec.z += 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
	
	move_vec.y  = 0
	move_vec = move_vec.rotated(Vector3(0,1,0), rotate)
	move_vec = move_vec.normalized()
	
	velocity.y += delta * gravity
	
	var hv = velocity
	hv.y = 0
	
	var new_pos = move_vec * MOVE_SPEED
	var accel = DE_ACCELERATION
	
	if (move_vec.dot(hv) > 0):
		accel = ACCELERATION
	
	hv = hv.linear_interpolate(new_pos, accel*delta)
	
	velocity.x = hv.x
	velocity.z = hv.z
	
	if Input.is_action_pressed("sprint"):
		speed_Modifier = SPRINT_SPEED
	
#	if Input.is_action_just_pressed("jump") and falling != true:
#		velocity.y = 5 * speed_Modifier

	
	velocity = move_and_slide(velocity * speed_Modifier, Vector3(0,1,0))
	
	if Input.is_action_pressed("attack") and !anim_player.is_playing():
		anim_player.play("attack")
		var coll = raycast.get_collider()
		if raycast.is_colliding() and coll.has_method("kill"): #if object it is colliding with has a kill method then kill it
			coll.kill()
	
func kill():
	get_tree().reload_current_scene()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
