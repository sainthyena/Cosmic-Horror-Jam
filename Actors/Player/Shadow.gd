extends Area2D
#onready var spawnPoint1 = $SpawnPointShadow.global_position
#onready var spawnPoint2 = $SpawnPointShadow2.global_position
#onready var spawnPoint3 = $SpawnPointShadow3.global_position
#onready var spawnPoint4 = $SpawnPointShadow4.global_position
onready var showing = true

func _ready():
	self.visible = false
	showing = false
##
#func show_position():
#	if showing:
#		var position = randi() % 4
#		if position == 0:
#			self.set_global_position(spawnPoint1)
##
#		elif position == 1:
#			self.set_global_position(spawnPoint2)
##
#		elif position == 2:
#			self.set_global_position(spawnPoint3)
##
#		elif position == 3:
#			self.set_global_position(spawnPoint4)
##
#
func show_randomly():
#	show_position()
#	print (self.global_position)
	var pick = randi() % 2
	if pick <= 1:
		showing = true
		self.visible = true
		$HideTimer.start()
#
	elif pick >= 2:
		showing = false
		self.visible = false
		$HideTimer.start()
#

func _on_HideTimer_timeout():
	self.visible = false


func _on_ShowTimer_timeout():
	show_randomly()
