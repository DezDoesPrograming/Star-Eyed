extends Label

func _on_Button_beready():
	show()
	text = ""

func _on_Star_heal():
	text = "-20 PTS"
	$Timer.start()
	add_color_override("font_color", Color(255, 0, 0, 255))


func _on_Main_hit():
	text = "-15 PTS"
	$Timer.start()
	add_color_override("font_color", Color(255, 0, 0, 255))


func _on_Star_area_entered(area):
	text = "+1 PTS"
	$Timer.start()
	add_color_override("font_color", Color(0, 255, 0, 255))


func _on_Heal_timeout():
	text = ""


func _on_Health_death():
	hide()


func _on_Star_win():
	hide()
