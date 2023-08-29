extends Label

func _process(_delta):
	if Input.is_action_pressed("move_powerup"):
		hide()
