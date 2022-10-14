extends Area2D

var area_active = false

func _input(event):
	if get_node_or_null('DialogPlayer') == null:
		if Input.is_action_just_pressed("ui_dialog_trigger"): #and area_active:
			SignalBus.emit_signal("display_dialog")
			
func _on_Dialog_Caller_area_entered(area):
	area_active = true
	print ("area entered")
	
	
func _on_Dialog_Caller_area_exited(area):
	area_active = false
	print ("area left")
