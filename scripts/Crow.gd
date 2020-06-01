extends Area2D

export var maxSpeed = 15
var motion = Vector2.ZERO

onready var sprite = $Sprite
onready var animation = $AnimationPlayer
onready var gameController = get_node("/root/GameController")

func _physics_process(_delta):
	pass

func _on_Crow_body_entered(body):
	if body.is_in_group("player"):
		pass
