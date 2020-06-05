extends Area2D

export (NodePath) var triggerTarget = null

var eventActivated = false

func _on_Trigger_body_entered(body):
	if body.is_in_group("player"):
		#do something with triggerTarget here
		pass
