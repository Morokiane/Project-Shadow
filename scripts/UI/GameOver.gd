extends CenterContainer

func _on_Newbtn_pressed():
# warning-ignore:return_value_discarded
	# get_tree().change_scene("res://Scenes/World.tscn")
	# SoundFx.Play("click")

func _on_Quitbtn_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/UI/StartMenu.tscn")
	# SoundFx.Play("click")
