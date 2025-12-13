extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(_body: Node2D) -> void:
	Engine.time_scale = 0.5 #Slowdown time when die
	print('You Died')
	_body.get_node('CollisionShape2D').queue_free() #Animate falling body when die
	timer.start() #Start the delay timer (0.6s)


func _on_timer_timeout() -> void:
	Engine.time_scale = 1 #Default time
	get_tree().reload_current_scene() #Reload current scene when die
