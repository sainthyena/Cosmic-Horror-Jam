extends Area2D

onready var timer = $Timer
var timer_ended =false
var is_down = false
var activePlayer: Player
export var levelId: String
onready var activeSaved = false


func _physics_process(delta):
	if timer_ended:
		success()
	
func _on_Timer_timeout():
	timer_ended = true
	
	
func success():
	if Player and !activeSaved:
		UserDataManager.set_data("save-file", { level = levelId })
		UserDataManager.save_data()
		activeSaved = true
		LevelManager.goto_scene("res://Levels/IntroCutscene.tscn")
