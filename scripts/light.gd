extends Area2D

#const character = preload("res://character.tscn")

onready var light = $Light2D
#onready var sprite = $Sprite
onready var collision = $CollisionShape2D

export var lightCanScale = false
export (float) var speed = 200
export (float) var lightSpeed = .01
export var lanternScale = Vector2(2,2)

var energy = 1

func _ready():
	set_scale (lanternScale)
#	sprite = Color(0, 0, 1, .5) # blue shade
#	sprite.modulate.a = 1
	
func _process(delta):
	if Input.get_action_strength("Right Analog - Right"):
		Move(speed, 0, delta)
	if Input.get_action_strength("Right Analog - Left"):
		Move (-speed, 0, delta)
	if Input.get_action_strength("Right Analog - Up"):
		Move (0, -speed, delta)
	if Input.get_action_strength("Right Analog - Down"):
		Move (0, speed, delta)

#	sprite.modulate.a - .1
	
	if lightCanScale == true:
		lanternScale = lanternScale - Vector2(lightSpeed, lightSpeed) * delta
		set_scale (lanternScale)

		energy = light.energy - .001
		light.set_energy (energy)
		
		if lanternScale < Vector2(0,0):
			lightCanScale = false
			collision.disabled = true
			print("flashlight is gone")
	
#	if lanternScale == Vector2(0,0):
#		sprite.modulate.a - .1

func Move(xspeed, yspeed, delta):
	position.x += xspeed * delta
	position.y += yspeed * delta
