tool
extends Control

var resource: Resource
var load_completed: bool = false

func _ready() -> void:
	load_completed = false
	$AnimationPlayer.play("Load")


func set_resource(loaded_resource: Resource) -> void:
	resource = loaded_resource
	load_completed = true
	LevelManager.set_new_scene(resource)
	queue_free()
