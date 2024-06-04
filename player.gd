extends Area2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right_move"):
		velocity.x += 1
	if Input.is_action_pressed("left_move"):
		velocity.x -= 1
	if Input.is_action_pressed("down_move"):
		velocity.y += 1
	if Input.is_action_pressed("up_move"):
		velocity.y -= 1
	
	# 根据输入方向计算速度向量

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed


	# 应用移动
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
