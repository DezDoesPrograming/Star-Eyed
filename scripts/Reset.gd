extends Button

signal beready

func _ready():
	emit_signal("beready")
	hide()

func _on_Health_death():
	show()


func _on_Reset_pressed():
	emit_signal("beready")
	hide()
