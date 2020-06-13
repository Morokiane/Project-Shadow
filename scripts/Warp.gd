extends Area2D

export (NodePath) var moveTarget = null

var inDoor = false
onready var doorIcon = $Indicator

func _ready():
	doorIcon.hide()

func _process(_delta):
	if Input.is_action_just_pressed("interact") && inDoor == true:
		get_tree().call_group("player", "MoveTo", get_node(moveTarget).position)

func _on_Door_body_entered(body):
	if body.is_in_group("player"):
		inDoor = true
		doorIcon.show()

func _on_Door_body_exited(body):
	if body.is_in_group("player"):
		inDoor = false
		doorIcon.hide()
