extends StaticBody2D

func _ready():
	if QuarryVisited.quarry_visited:
		self.visible = true
