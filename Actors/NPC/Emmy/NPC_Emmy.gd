extends Node2D
onready var spriteAnimation = $Sprite_Animation
var has_not_talked = true
var area_active = false


func _process(delta):
	var pick = randi() % 2
	if(pick == 0) and not spriteAnimation.is_playing():
		spriteAnimation.play("Blink")

	elif(pick == 1) and not spriteAnimation.is_playing():
		spriteAnimation.play("Idle")



func _on_Talk_Space_area_entered(area):
	area_active = true
	
func _input(event):
	if area_active and Player and has_not_talked and Input.is_action_just_pressed("ui_dialog_trigger"):
		has_not_talked = false
		SignalBus.emit_signal("display_dialog")


func _on_Talk_Space_area_exited(area):
	area_active = false
