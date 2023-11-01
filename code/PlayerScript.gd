extends CharacterBody2D

var speed:float = 100.0
const acc = 70
const fric = 90

var size := Vector2(20, 20)
# The size of a cell in pixels.
var cell_size := Vector2(16, 16)

@onready var animated_sprite = $AnimationTree["parameters/playback"]
@onready var placer = $Sprite2D/placer

func _physics_process(_delta):
	var input_dir:Vector2 = input()
	var mouse_pos:Vector2 = mousePos()

	if input_dir == Vector2.ZERO:
		friction()
		
	animate(input_dir, mouse_pos)
	acclerate(input_dir)
	placing(mouse_pos, input_dir)

	
	move()
	
func input() -> Vector2:
	var input_dir:Vector2 = Vector2.ZERO

	if Input.is_action_pressed("up") or Input.is_action_pressed("down"):
		input_dir.y = Input.get_axis("up", "down")
	else:
		input_dir.x = Input.get_axis("left", "right")
	
	input_dir.normalized()
	
	return input_dir
	
func acclerate(direction):
	velocity = velocity.move_toward(direction * speed, acc)
	
func friction():
	velocity = velocity.move_toward(Vector2.ZERO, fric)
	
func move():
	move_and_slide()

func animate(direction, mouse):
	if direction.x == 1:
		animated_sprite.travel("walk_right")
	elif direction.x == -1:
		animated_sprite.travel("walk_left")
	elif direction.y == -1:
		animated_sprite.travel("walk_forward")
	elif direction.y == 1:
		animated_sprite.travel("walk_back")
	else:
		if mouse.x > 5:
			animated_sprite.travel("idle_right")
		elif mouse.x < -5:
			animated_sprite.travel("idle_left")
		elif mouse.y > 5:
			animated_sprite.travel("idle_forward")
		elif mouse.y < -5:
			animated_sprite.travel("idle_backward")

func mousePos() -> Vector2:
	var mouse_pos = Vector2.ZERO
	
	mouse_pos = get_local_mouse_position()
	mouse_pos
	
	return mouse_pos
	
func placing(mouse, direction):
	var place1 = Vector2(16, 0)
	var place2 = Vector2(16,16)
	var place3 = Vector2(0,16)
	var place4 = Vector2(-16, 0)
	var place5 = Vector2(-16,-16)
	var place6 = Vector2(0,-16)
	var place7 = Vector2(-16,16)
	var place8 = Vector2(16,-16)
	if mouse.x > 5 or direction.x == 1:
		placer.position = place1
	elif mouse.x < -5 or direction.x == -1:
		placer.position = place4
	elif mouse.y > 5 or direction.y == 1:
		placer.position = place3
	elif mouse.y < -5 or direction.y == -1:
		placer.position = place6
		
func use(item):
	pass
