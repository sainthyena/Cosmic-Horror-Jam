extends CanvasLayer

func _physics_process(delta):
	if Input.is_action_just_released("pause"):
		self.visible = true

func onready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _ready() -> void:
	$SideMenu/ReturnButton.connect('pressed', self, '_onExitPressed')
	$SideMenu/MenuButton.connect('pressed', self, '_onMenuPressed')

func _onExitPressed():
	get_tree().paused = false
	self.visible = false


func _on_Menupressed() -> void:
	get_tree().paused = false
	LevelManager.goto_scene("res://Scenes/Main_Menu.tscn")
