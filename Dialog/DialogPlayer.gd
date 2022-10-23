extends CanvasLayer

export(String, "TimelineDropdown") var timeline: String
var finished = false
var dialog = {}


func _ready():
#	SignalBus.connect("Jim_Entry", self, "on_display_Entry")
	SignalBus.connect("display_dialog", self, "on_display_dialog")


func unpause(_unused_argument):
	print ("unpaused")
	get_tree().paused = false
	finished = true
	
	
func on_display_dialog():
	if not get_tree().paused:
		get_tree().paused = true
		dialog = Dialogic.start(timeline)
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		add_child(dialog)
		dialog.connect("timeline_end", self, "unpause")
		print("displaying dialog...")
			
	else:
			
		pass
	
