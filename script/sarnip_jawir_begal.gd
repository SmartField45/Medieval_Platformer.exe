extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Add the gravity.
func _physics_process(delta: float) -> void:#For fixed FPS
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Space") and is_on_floor():
		velocity.y = JUMP_VELOCITY #eksekusi lompat

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("A", "D")
	
	#flip the animation
	if direction > 0:#Moving to the right
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	else:
		pass
	
	#adding animation
	if is_on_floor():
		if direction == 0:#standing/idle
			animated_sprite_2d.play('jawir_warrior')
		else:#running
			animated_sprite_2d.play('run')
	else:
		animated_sprite_2d.play('jump')
	
	#moving
	if direction:
		velocity.x = direction * SPEED #
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
