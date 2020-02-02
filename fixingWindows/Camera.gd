extends Camera

#const MOVE_SPEED = 8
const SPRINT_SPEED = 1.05
const MAX_JUMP_TIME = 2
const MOUSE_SENS = 0.5
const MOVE_SPEED = 6
const ACCELERATION = 3
const DE_ACCELERATION = 5


onready var anim_player = $AnimationPlayer
onready var raycast = $RayCast
onready var wrench_count = $CanvasLayer/wrench_count

var gravity = -9.8
var velocity = Vector3()
var newVel = Vector3()
var rotate = 0
var jump_time = 0
var falling = false
var view_x_pos = 0


# Called when the node enters the scene tree for the first time.
#for mouse movement
func _input(event):
	if event is InputEventMouseMotion:
		if view_x_pos > -70 and view_x_pos < 70:
			rotation_degrees.x -= MOUSE_SENS * event.relative.y
			view_x_pos -= MOUSE_SENS * event.relative.y
			print(view_x_pos)
		else:
			if view_x_pos > -70:
				view_x_pos -= 1
				rotation_degrees.x -= 1
			else:
				view_x_pos += 1
				rotation_degrees.x +=1
		
		rotation_degrees.y -= MOUSE_SENS * event.relative.x
		rotate -= (MOUSE_SENS * event.relative.x) * 3.141593 / 180

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
