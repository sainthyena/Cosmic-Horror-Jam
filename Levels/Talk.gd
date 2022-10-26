extends Area2D
var has_talked = false
var area_active = false

func _on_Talk_area_entered(area):
	area_active = true

	
func _on_Talk_area_exited(area):
	area_active = false

	
func _input(event):
	if area_active and Player and Input.is_action_just_pressed("ui_dialog_trigger") and not has_talked:
		display_dialog()
		
func display_dialog():
	if not get_tree().paused:
			get_tree().paused = true
			var dialog = Dialogic.start("Emma_Mom")
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			add_child(dialog)
			dialog.connect("timeline_end", self, "unpause")

func unpause(_unused_argument):
	has_talked = true
	get_tree().paused = false	

