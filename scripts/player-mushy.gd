extends CharacterBody2D

@onready var game_manager = %GameManager

const SPEED = 100.0
const JUMP_VELOCITY = -250.0
const JUMP_TO_FLY_COUNT = 2
var idle_timer = 0
var fly_count = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var speed_multiplier = game_manager.speed_multiplier
	var jump_adder = game_manager.jump_adder
	# Add the gravity.
	if not is_on_floor():
		if animated_sprite.animation == "fly":
			velocity.y += gravity * delta / 1.75
		else : velocity.y += gravity * delta
	
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#Play animation
	if is_on_floor():
		if direction == 0:
			idle_timer += delta
			if idle_timer >= 3:
				animated_sprite.play("sleep")
			else :
				animated_sprite.play("idle")
		else:
			idle_timer = 0
			animated_sprite.play("run")
		fly_count = 0
	else:
		idle_timer = 0
		if fly_count >= JUMP_TO_FLY_COUNT:
			if velocity.y <= 0:
				animated_sprite.play("fly")
			else: animated_sprite.play("fall_fly")
		elif velocity.y <= 0:
			animated_sprite.play("jump")
		else: animated_sprite.play("fall")
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY + jump_adder
	elif Input.is_action_just_pressed("jump"):
		velocity.y = (JUMP_VELOCITY + jump_adder)
		fly_count += 1
	
	if fly_count >= JUMP_TO_FLY_COUNT:
		if Input.is_action_pressed("jump"):
			velocity.y = (JUMP_VELOCITY + jump_adder) * 0.4
	
	if direction:
		velocity.x = direction * SPEED * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * speed_multiplier)
		
	move_and_slide()
