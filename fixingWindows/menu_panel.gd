extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$menu_music.play()
	pass # Replace with function body.
	
	
func _blood():
	$menu_back/AnimationPlayer.play("blood")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
