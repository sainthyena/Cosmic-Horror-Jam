extends StaticBody2D

class_name SaveTrigger
var activePlayer: Player
export var levelId: String
onready var glowLight = $Glow
onready var activeSaved = false

func _ready():
	$AnimationPlayer.play("Idle")

func _on_Save_Area_area_entered(area):
	if Player and !activeSaved:
		UserDataManager.set_data("save-file", { level = levelId })
		UserDataManager.save_data()
		print("hewo")
		$AnimationPlayer.play("Speak")
		$Timer.start()
#		emit_signal("Game_Saved")
		


func _on_Timer_timeout():
	$AnimLabel.play("Save")
	glowLight.visible = true
	$GlowLightShow.play("FadeIn")
	activeSaved = true
