extends Label

export var rspeed = 0.1
var tscore
var scrn_size
var dead


func _on_Button_beready():
	show()
	tscore = 0
	dead = false

func _on_Star_svalue(value):
	tscore = value
	if dead == false:
		text = "Score: " + str(tscore) + "/100"

func _on_Health_death():
	dead = true
	text = "Final Score: " + str(tscore) + "/100"


func _on_Star_win():
	dead = true
	text = "Final Score: " + str(tscore) + "/100"
