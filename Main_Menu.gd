extends Control

var actionAfterFade: String = "enableMenu"
onready var FadePanel = $MainMenu/FadePanel
var continueOnLevel: String

func _ready() -> void:
	$MainMenu/SideMenu/NewGameButton.connect('pressed', self, '_onNewPressed')
	$MainMenu/SideMenu/ContinueButton.connect('pressed', self, '_onContinuePressed')
#	$SideMenu/TestLevelButton4.connect('pressed', self, '_onTestLevelPressed', ["ExitLevel"])
	$MainMenu/SideMenu/OptionsButton.connect('pressed', self, '_onOptionsPressed')
	$MainMenu/SideMenu/QuitButton.connect('pressed', self, '_onQuitPressed')
	$MainMenu/FadePanel.connect("fade_complete", self, '_fadeComplete')
	$MainMenu/FadePanel.visible = true

#	_pick_random_title_image()
	
	UserDataManager.connect("loaded", self, "_on_save_loaded")
	
	if GameManager.hasSaveLoaded:
		_on_save_loaded()
	
	actionAfterFade = "enableMenu"
	FadePanel.fadeIn()




# disables the cursor and begins fade out to load next level
func _onNewPressed() -> void:
	actionAfterFade = "startNew"
	FadePanel.fadeOut()


func _onContinuePressed() -> void:
	actionAfterFade = "continue"
	FadePanel.fadeOut()
	
	
func _onTestLevelPressed(level: String) -> void:
	LevelManager.start_level(level)
	
	
func _onOptionsPressed() -> void:
	get_tree().change_scene_to(load('res://Scenes/Options_Screen.tscn'))
	
	
func _onQuitPressed() -> void:
	get_tree().quit()
	
	
# Enables input after the initial fade in and loads the next scene after fade out
func _fadeComplete() -> void: 
	if (actionAfterFade == "startNew"):
		LevelManager.start_level("Test_Corn")
	elif (actionAfterFade == "continue"):
		LevelManager.start_level(continueOnLevel)
	elif (actionAfterFade == "enableMenu"):
		FadePanel.mouse_filter = Control.MOUSE_FILTER_IGNORE
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_save_loaded():
	var saveFile = UserDataManager.get_data("save-file")
	if(saveFile != null):
		continueOnLevel = saveFile["level"]
	if(continueOnLevel != null && continueOnLevel != ""):
		$MainMenu/SideMenu/ContinueButton.disabled = false

#
#func _pick_random_title_image():
#	$MenuArt1.visible = false
#	$MenuArt2.visible = false
#
#	var pick = randi() % 2
#	if(pick == 0):
#		$MenuArt1.visible = true
#	elif(pick == 1):
#		$MenuArt2.visible = true
