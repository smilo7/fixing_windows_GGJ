extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_RichTextLabel_pressed():
	print("HELLO")
	get_tree().change_scene("res://Scenes/Milos.tscn")
	pass # Replace with function body.
