extends Node

signal zoom_changed(value)

func toggle_fullscreen(value):
	OS.window_fullscreen = value
	
func toggle_zoom(toggle):
	emit_signal("zoom_changed", toggle)
	
