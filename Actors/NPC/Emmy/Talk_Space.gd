extends Area2D

var has_not_talked = true
var area_active = false

func _on_Talk_Space_area_entered(area):
	area_active = true

	
func _on_Talk_Space_area_exited(area):
	area_active = false


	
func _input(event):
	if area_active and Player and has_not_talked and Input.is_action_just_pressed("ui_dialog_trigger"):
		has_not_talked = false
		display_dialog()
		
func display_dialog():
	if not get_tree().paused:
			get_tree().paused = true
			var dialog = Dialogic.start("Emmy_First")
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			add_child(dialog)
			dialog.connect("timeline_end", self, "unpause")

func unpause(_unused_argument):
	get_tree().paused = false	
