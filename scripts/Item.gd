extends Area2D

export var amount = Vector2(4,4)
export var increaseEnergy = 1.0

onready var gameController = get_node("/root/GameController")
# var player = preload("res://scripts/character.gd")
# onready var player = get_tree().get_root().get_node("character.tscn")

func _ready():
	pass
	
	# player = player.new()
	# print(gameController.player.lanternScale)
#	print(player.energy)

func _on_Oil_body_entered(body):

	var character = body.is_in_group("player")
	if character && gameController.player.lanternScale < Vector2 (3,3) && gameController.hasLantern == true:
		gameController.player.Item()
		queue_free()

func PowerUp():
	
	# gameController.player.lanternScale = amount
	# gameController.player.lanternScale.set_scale (amount)
	# player.energy = energy
	gameController.player.energy = gameController.player.energy + increaseEnergy
	gameController.player.energy.set_energy = increaseEnergy
	# print (player.lanternScale)
