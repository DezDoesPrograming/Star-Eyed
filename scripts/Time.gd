extends Label

var ttime
var dead

func _on_Button_beready():
	show()
	ttime = 0
	dead = false
	$Timer.start()

func _process(_delta):
	if dead == false:
		text = "Time: " + str(ttime)


func _on_Timer_timeout():
	if dead == false:
		ttime += 0.01 
		$Timer.start()


func _on_Health_death():
	dead = true
	text = "Final Time: " + str(ttime)


func _on_Star_win():
	dead = true
	text = "Final Time: " + str(ttime)
