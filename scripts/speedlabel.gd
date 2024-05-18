extends Label
@onready var game_manager = %GameManager

var default = ""
var speed_text = "SPEEEED"

func _process(_delta):
	if (game_manager.speed_multiplier > 1):
		text = speed_text
	else: text = default
