extends Camera2D

func _ready():
	GlobalSettings.connect("zoom_toggle", self, "on_zoom_toggled")
	
func on_zoom_toggled():
	self.zoom.x = 2
	self.zoom.y = 2
