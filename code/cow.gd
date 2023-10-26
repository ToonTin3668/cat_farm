extends CharacterBody2D

@onready var time = $Timer
var speed = 100

var rnf = RandomNumberGenerator.new
var my_random_number = randf_range(1, 10)
var time_left

func _ready():
	time.start(10)
	time_left = time.time_left

	

func _physics_process(delta):
	time_left = time.time_left


	if time_left <= my_random_number:
		position = Vector2(100, 100)
		var my_random_number = randf_range(1.0, 10.0)
		time.start(10)
		print("ll")
		print(time.time_left)
		print(my_random_number)
	else:
		print(time.time_left)
		print(my_random_number)
