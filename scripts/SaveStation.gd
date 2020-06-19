extends StaticBody2D

var canSave = false

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		canSave = true

func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		canSave = false

func _process(_delta):
	if Input.is_action_just_pressed("interact") && canSave == true:
		SaveLoad.SaveGame()

