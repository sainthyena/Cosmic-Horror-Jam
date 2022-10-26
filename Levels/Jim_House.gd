extends Node2D
#signal ShowPauseMenu()

var activePlayer: Player
export var levelId: String
onready var activeSaved = false
onready var cornAnimation = $Grow_Corn/Corn/CornAnim

func _ready():

	GameMusic.play()
	
	if Player and !activeSaved:
		UserDataManager.set_data("save-file", { level = levelId })
		UserDataManager.save_data()
		activeSaved = true


func _on_Corn_Trigger_area_entered(area):
	cornAnimation.play("close")
