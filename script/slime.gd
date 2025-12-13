extends Node2D

const SPEED = 60

var direction = -1

@onready var right_wall_ray_cast: RayCast2D = $RightWallRayCast
@onready var left_wall_ray_cast: RayCast2D = $"LeftWallRay Cast"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if right_wall_ray_cast.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	elif left_wall_ray_cast.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	else:
		pass
	position.x += direction*SPEED*delta
