extends Node

class_name Paused_Signal

var is_paused = false setget set_is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	
signal paused()
