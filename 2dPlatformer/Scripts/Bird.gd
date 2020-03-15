extends RigidBody2D

export var Speed = 150
export var left = 100
export var right = 300

func _integrate_forces(state):
	if position.x < left:
		$Sprite.flip_h=true
		Speed*=-1
	if position.x> right:
		$Sprite.flip_h=false
		Speed*=-1
	state.set_linear_velocity(Vector2(-Speed,0))
	state.set_angular_velocity(0) 
