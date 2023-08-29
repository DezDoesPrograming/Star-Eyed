extends AnimatedSprite

export var hpoffset = 9.5
var hp
var win

signal death
signal adeath

func _on_Button_beready():
	show()
	win = false
	hp = 3
	position.x += (hpoffset * 2)
	play(str(hp))

func _on_Star_heal():
	if not hp >= 10:
		hp += 1
		play(str(hp))
		position.x += hpoffset

func _on_Main_hit():
	if not hp <= 0:
		hp -= 1
		play(str(hp))
		if not hp < 1:
			position.x -= hpoffset
	if hp == 1:
		emit_signal("adeath")
	if hp <= 0:
		emit_signal("death")
