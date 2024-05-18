extends Control

@onready var speed_timer = $SpeedTimer
var total_flowers = 0
var total_happy_shrooms = 0
var speed_multiplier = 1;
var jump_adder = 0;

func add_one_flower():
	total_flowers += 1
	
func give_one_flower():
	total_flowers -= 1
	total_happy_shrooms += 1

func speeeed():
	speed_multiplier = 1.66
	jump_adder = -50
	speed_timer.stop()
	speed_timer.start()

func _on_speed_timer_timeout():
	speed_multiplier = 1
	jump_adder = 0
	speed_timer.stop()
