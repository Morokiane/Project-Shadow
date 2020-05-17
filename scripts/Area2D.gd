extends Area2D

onready var sprite = $Sprite

func _ready():
	sprite.visible = false

func _on_Area2D_area_entered(_area):
	sprite.visible = true

func _on_Area2D_area_exited(_area):
	sprite.visible = false
