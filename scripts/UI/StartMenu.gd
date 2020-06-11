extends Control

onready var gameController = get_node("/root/GameController")

func _on_Startbtn_pressed():
	# SoundFx.Play("click")
	gameController.startMenu = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/levels/Town.tscn")
func _on_Loadbtn_pressed():
	pass # Replace with function body.

func _on_Quitbtn_pressed():
	get_tree().quit()
