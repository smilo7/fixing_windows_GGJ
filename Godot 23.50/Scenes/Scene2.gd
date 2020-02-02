extends Node2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass
	
func _process(delta):
	#print(get_local_mouse_position())
	#print(get_global_mouse_position())
	$Cursor.position = get_local_mouse_position()
