extends Node2D

onready var anim = $AnimationPlayer

var canSave = false

func _process(_delta):
    if Input.is_action_just_pressed("interact") && canSave == true:
        anim.play("save")
        SaveLoad.SaveGame()

func _on_Area2D_body_entered(body):
    if body.is_in_group("player"):
        canSave = true