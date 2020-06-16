extends Control

onready var gameController = get_node("/root/GameController")
onready var scene = get_tree().get_root()

func _ready():
	if scene == scene:
		print("Start Menu loaded")

func _on_Startbtn_pressed():
	# SoundFx.Play("click")
	gameController.startMenu = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/levels/Town.tscn")
func _on_Loadbtn_pressed():
	pass # Replace with function body.

func _on_Quitbtn_pressed():
	get_tree().quit()
