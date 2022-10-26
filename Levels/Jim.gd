extends StaticBody2D
var has_not_talkedJIM = true
var area_active = false

func _on_Talk_Space_area_entered(area):
	area_active = true
	
func _input(event):
	if area_active and Player and has_not_talkedJIM and Input.is_action_just_pressed("ui_dialog_trigger"):
		has_not_talkedJIM = false
		SignalBus.emit_signal("display_dialog")


func _on_Talk_Space_area_exited(area):
	area_active = false
