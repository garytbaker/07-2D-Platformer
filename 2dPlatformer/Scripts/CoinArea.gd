extends Area2D


func _physics_process(delta):
	var bodies= get_overlapping_bodies()
	for body in bodies:
		if body.name =="Player":
			body.updateScore(100)
			GameState.level1coins.erase(get_parent().position)
			GameState.level2coins.erase(get_parent().position)
			get_parent().queue_free()
