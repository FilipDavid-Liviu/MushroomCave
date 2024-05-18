extends Area2D

@onready var merlin_image = $AnimatedSprite2D
@onready var timer = $Timer
@onready var timer_2 = $Timer2
@onready var label = $MerlinLabel

func _ready():
	print("Merlin ready for some magic!")
	print("~skadush!")
	label.text = "Each bush will give you one flower, each shroom will take one from you!"

func _on_body_entered(_body):
	if timer.is_stopped() and timer_2.is_stopped():
		merlin_image.play("disappear")
		label.text = "Skadush!"

func _on_body_exited(_body):
	if timer.is_stopped() and timer_2.is_stopped():
		timer.start()

func _on_timer_timeout():
	if timer_2.is_stopped():
		merlin_image.play("reappear")
		timer.stop()
		timer_2.start()
	else: timer.start()

func _on_timer_2_timeout():
	merlin_image.play("wait")
	label.text = "Each bush will give you one flower, each shroom will take one from you!"
	timer_2.stop()
