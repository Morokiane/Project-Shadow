extends Control

func _ready():
	VisualServer.set_default_clear_color(Color("000000"))

func _on_Startbtn_pressed():
	# SoundFx.Play("click")
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/levels/Town.tscn")
	
func _on_Loadbtn_pressed():
	pass # Replace with function body.

func _on_Quitbtn_pressed():
	get_tree().quit()
