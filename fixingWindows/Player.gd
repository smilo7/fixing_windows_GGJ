extends KinematicBody


const MOVE_SPEED = 8
const MOUSE_SENS = 0.5

onready var anim_player = $AnimationPlayer
onready var raycast = $RayCast

 


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) #get mouse in centre of screen and set to 
	yield(get_tree(), "idle_frame") #wait frame
	get_tree().call_group("zombies", "set_player", self)
	


#for mouse movement
func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.y -= MOUSE_SENS * event.relative.x

func _process(delta):
	if Input.is_action_pressed("exit"):
		get_tree().quit()
	if Input.is_action_pressed("restart"):
		kill()
 
func _physics_process(delta):
	var move_vec = Vector3()
	if Input.is_action_pressed("move_forwards"):
		move_vec.z -= 1
	if Input.is_action_pressed("move_backwards"):
		move_vec.z += 1
	if Input.is_action_pressed("move_left"):
		move_vec.x -= 1
	if Input.is_action_pressed("move_right"):
		move_vec.x += 1
	move_vec = move_vec.normalized()
	move_vec = move_vec.rotated(Vector3(0, 1, 0), rotation.y)
	move_and_collide(move_vec * MOVE_SPEED * delta)
   
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
