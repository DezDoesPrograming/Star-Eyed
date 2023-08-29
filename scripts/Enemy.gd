extends Node

export var speed = 4.5
var dead
var adead

signal hit

func _on_Button_beready():
	$Enemy.show()
	$Enemy.position = Vector2(240, 100)
	$Player.position = Vector2(240, 300)
	$BG.play("alive")
	dead = false
	adead = false

func _process(_delta):
	var dir = Vector2.ZERO
	var player_pos = $Player.position
	var enemy_pos = $Enemy.position
	
	if dead == false:
		if player_pos.x > enemy_pos.x:
			dir.x += 1
			#enemy_state.play("right")
		elif player_pos.x < enemy_pos.x:
			dir.x -= 1
			#enemy_state.play("left")
		elif player_pos.x == enemy_pos.x:
			dir.x = 0
		
		if player_pos.y > enemy_pos.y:
			dir.y += 1
			#enemy_state.play("down")
		elif player_pos.y < enemy_pos.y:
			dir.y -= 1
			#enemy_state.play("up")
		elif player_pos.y == enemy_pos.y:
			dir.y = 0
	
	$Enemy.position += dir * speed

func _on_Player_area_entered(area):
	if area.name == "Enemy":
		emit_signal("hit")
		$Enemy.position = Vector2(240, 100)
		if dead == true:
			$Player/Death.play()
		else:
			$Player/Hit.play()

func _on_Star_heal():
	adead = false

func _on_Health_adeath():
	adead = true

func _on_Health_death():
	dead = true
	$BG.play("dead")
	$Enemy.hide()

func _on_Star_win():
	dead = true
	$BG.play("win")
	$Enemy.hide()

func _on_Main_hit():
	if adead == false:
		$Player.position = Vector2(240, 300)
