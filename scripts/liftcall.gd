extends Area2D

onready var anim = $AnimatedSprite

var callLift = false
var canCall = false

signal comeHither

func _process(_delta):
    if Input.is_action_just_pressed("interact") && canCall:
        print("wtf")
        CallLift()

func CallLift():
    if GameController.liftAtTop:
        emit_signal("comeHither")
        anim.play("active")
        print("on its way")
        
func _on_LiftCall_body_entered(body):
    if body.is_in_group("player"):
        canCall = true
        print("can call lift")

func _on_LiftCall_body_exited(body):
    if body.is_in_group("player"):
        canCall = false
        print("can't call lift")