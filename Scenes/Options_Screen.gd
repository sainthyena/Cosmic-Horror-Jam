extends Control
var zoomSettings = {}

signal ZoomChanged(value)

func _ready():
	pass

func _on_ReturnButton_pressed():
	get_tree().change_scene_to(load('res://Scenes/Main_Menu.tscn'))


func _on_Zoom1Button_toggled(button_pressed):
	GlobalSettings.toggle_zoom(button_pressed)


func _on_ZoomHalfButton_toggled(button_pressed):
	GlobalSettings.toggle_zoom(button_pressed)
