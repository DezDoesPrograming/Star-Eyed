extends Area2D

export var rspeed = 0.1
var score
var scrn_size
var dead
var win

signal heal
signal svalue(value)
signal win

func _on_Button_beready():
	score = 0
	show()
	win = false
	dead = false
	scrn_size = get_viewport_rect().size

func _on_Health_death():
	dead = true
	hide()

func _process(_delta):
	rotation += rspeed
	if score < 0:
		score = 0
	if Input.is_action_pressed("move_powerup")\
	 and score >= 15 and dead == false\
	 and win == false:
		emit_signal("heal")
		$Heal.play()
		score -= 20
	emit_signal("svalue", score)
	if score >= 100:
		emit_signal("win")
		$Win.play()
		win = true
		hide()

func _on_Star_area_entered(area):
	if area.name == "Player" and win == false:
		position = Vector2(rand_range(0, scrn_size.x), rand_range(0, scrn_size.y))
		$Collect.play()
		score += 1

func _on_Main_hit():
	score -= 15

