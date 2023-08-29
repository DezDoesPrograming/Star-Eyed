extends Area2D

export var spd = 600
var scrn_size
var dead

func _on_Button_beready():
	show()
	scrn_size = get_viewport_rect().size
	dead = false

func _process(delta):
	var vel = Vector2.ZERO
	if dead == false:
		$AnimatedSprite.play("idle")
		if Input.is_action_pressed("move_up"):
			vel.y -= 1
			$AnimatedSprite.play("up")
		if Input.is_action_pressed("move_down"):
			vel.y += 1
			$AnimatedSprite.play("down")
		if Input.is_action_pressed("move_right"):
			vel.x += 1
			$AnimatedSprite.play("right")
		if Input.is_action_pressed("move_left"):
			vel.x -= 1
			$AnimatedSprite.play("left")
	
	if vel.length() > 0:
		vel = vel.normalized() * spd
	
	position += vel * delta
	position.x = clamp(position.x, 0, scrn_size.x)
	position.y = clamp(position.y, 0, scrn_size.y)
	


func _on_Health_death():
	dead = true
	$AnimatedSprite.play("dead")


func _on_Star_win():
	dead = true
	$AnimatedSprite.play("win")
