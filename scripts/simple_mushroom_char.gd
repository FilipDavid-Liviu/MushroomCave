extends CharacterBody2D

@onready var timer = $Timer
@onready var game_manager = %GameManager
const SPEED = 50.0
const JUMP_VELOCITY = -250.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var shroom_image = $ShroomArea/AnimatedSprite2D
@onready var left_cast = $LeftCast
@onready var right_cast = $RightCast
var direction = 1

func _ready():
	pass

func _on_shroom_area_body_entered(_body):
	if timer.is_stopped():
		if game_manager.total_flowers > 0:
			game_manager.give_one_flower()
			shroom_image.play("jump")
			timer.start()

func _on_timer_timeout():
	shroom_image.play("idle")
	timer.stop()

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if direction > 0:
		shroom_image.flip_h = false
	elif direction < 0:
		shroom_image.flip_h = true
	
	if shroom_image.animation == "jump" and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if shroom_image.animation == "walk":
		if is_on_floor():
			if right_cast.is_colliding():
				direction = -1
			if left_cast.is_colliding():
				direction = 1
			velocity.x = direction * SPEED
	else:
		velocity.x = 0
	
	move_and_slide()
