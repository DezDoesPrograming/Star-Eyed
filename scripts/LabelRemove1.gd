extends Label

func _process(_delta):
	if Input.is_action_pressed("move_up")\
	 or Input.is_action_pressed("move_down")\
	 or Input.is_action_pressed("move_left")\
	 or Input.is_action_pressed("move_right"):
		hide()
