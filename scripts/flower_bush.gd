extends Area2D

@onready var area_image = $AnimatedSprite2D
@onready var timer = $Timer
@onready var game_manager = %GameManager

func _on_body_entered(_body):
	if timer.is_stopped():
		area_image.play("picked")
		game_manager.add_one_flower()
		timer.start()


func _on_timer_timeout():
	area_image.play("default")
	timer.stop()
