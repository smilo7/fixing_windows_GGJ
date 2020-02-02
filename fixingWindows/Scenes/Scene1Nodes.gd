extends Node2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass
	
func _process(delta):
	#print(get_local_mouse_position())
	#print(get_global_mouse_position())
	$Cursor.position = get_local_mouse_position()
	if Input.is_action_just_pressed("Left_Mouse"):
		$Sound.play()

func _on_Area2D_mouse_exited():
	print("Mouse exit")
	pass # Replace with function body.


func _on_Area2D_mouse_entered():
	print("Mouse entered")
	pass # Replace with function body.
