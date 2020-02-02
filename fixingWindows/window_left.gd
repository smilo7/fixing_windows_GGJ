extends AnimatedSprite3D

var num_frames
var current_frame = 0

func _ready():
	set_process_input(true)
	num_frames = get_sprite_frames().get_frame_count("default")

func repair():
		current_frame = (current_frame + 1) % num_frames
		set_frame(current_frame)
