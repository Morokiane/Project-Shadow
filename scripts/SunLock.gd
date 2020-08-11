extends Node2D

onready var spokeAnim = $spokes
onready var centerAnim = $center

var canAddKey = false

func _on_Area2D_body_entered(body):
    if body.is_in_group("player"):
        canAddKey = true
        
func _on_Area2D_body_exited(body):
    if body.is_in_group("player"):
        canAddKey = false
        
func _process(_delta):
    if Input.is_action_just_pressed("interact"):
        AddKey()

func AddKey():
    pass