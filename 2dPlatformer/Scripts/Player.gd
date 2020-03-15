extends KinematicBody2D
const UP = Vector2(0,-1)
var motion = Vector2()
export var acceleration = 50
export var Speed = 400
export var Gravity = 25
export var JumpHeight = 750
var Score = 0
func _physics_process(delta):
	motion.y+=Gravity
	if position.y >=800:
		die()
	if Input.is_action_pressed("save"):
		GameState.save()
	if Input.is_action_pressed("load"):
		GameState.load()
	if Input.is_action_pressed("ui_right"):
		motion.x+=acceleration
		motion.x=min(motion.x,Speed)
		$Sprite.flip_h=false
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x-=acceleration
		motion.x=max(motion.x,-Speed)
		$Sprite.flip_h=true
		$Sprite.play("Run")
	else:
		$Sprite.play("Idle")
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y=-JumpHeight
		motion.x = lerp(motion.x,0,0.15)
	else:
		if motion.y<=0:
			$Sprite.play("Jump")
		if motion.y>0:
			$Sprite.play("Falling")
		motion.x = lerp(motion.x,0,0.03)
	motion = move_and_slide(motion,UP)
	GameState.currentpos=position


	
func updateScore(x):
	GameState.Score+=x
func die():
	queue_free()
	print("dead")
	get_tree().change_scene("res://GameOver.tscn")
