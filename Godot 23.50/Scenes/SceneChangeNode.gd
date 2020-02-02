extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_RichTextLabel_pressed():
	print("HELLO")
	get_tree().change_scene("res://Scenes/tester.tscn")
	


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/tester.tscn")
	pass # Replace with function body.
