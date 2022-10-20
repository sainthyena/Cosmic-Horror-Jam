extends Node2D
export var levelId: String


func _on_MenuTest_area_entered(area):
	
	UserDataManager.set_data("save-file", { level = levelId })
	UserDataManager.save_data()
	print ("saved game")
#	get_tree().change_scene_to(load('res://Scenes/Main_Menu.tscn'))
