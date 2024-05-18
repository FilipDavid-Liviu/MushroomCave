extends Label
@onready var game_manager = %GameManager

var first_line = "Flowers:"
var second_line = "Happy shrooms:"
var first_value = 0
var second_value = 0

func _process(_delta):
	first_value = game_manager.total_flowers
	second_value = game_manager.total_happy_shrooms
	text = first_line + str(first_value) + "\n" + second_line + str(second_value)
