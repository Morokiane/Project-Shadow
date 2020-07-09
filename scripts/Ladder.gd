extends Area2D

func _on_Ladder_body_entered(body):
	if body.is_in_group("player"):
		GameController.player.onLadder = true
		print (GameController.player.onLadder)

func _on_Ladder_body_exited(body):
	if body.is_in_group("player"):
		GameController.player.onLadder = false
		print (GameController.player.onLadder)
