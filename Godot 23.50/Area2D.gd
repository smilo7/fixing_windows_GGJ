extends Area2D

const MOUSE_SENS = 0.4

onready var anim_player = $AnimationPlayer
onready var raycast = $RayCast

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	yield(get_tree(), "idle_frame")
	pass
	
func _process(delta):
	if Input.is_key_pressed(BUTTON_RIGHT):
		print("PLEASE")
