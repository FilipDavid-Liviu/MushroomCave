extends Area2D
@onready var timer = $Timer
@onready var area_image = $AnimatedSprite2D
@onready var game_manager = %GameManager
var default

func choose_fruit():
	var i = randi() % 2
	if i == 0:
		default = "apple"
	if i == 1:
		default = "pear"
	print(default)

func _ready():
	choose_fruit()
	area_image.play(default)


func _on_body_entered(_body):
	if timer.is_stopped():
		area_image.play("picked")
		game_manager.speeeed()
		timer.start()


func _on_timer_timeout():
	choose_fruit()
	area_image.play(default)
	timer.stop()
