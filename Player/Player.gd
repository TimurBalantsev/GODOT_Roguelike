extends CharacterBody2D
class_name Player
@export
var speed = 300.0
@onready
var animation_node = get_node("AnimatedSprite2D")
@onready
var sword_node = get_node("Sword")

func _ready():
	animation_node.play('idle')

func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction:
		animation_node.play('run')
	else:
		animation_node.play('idle')
	velocity = direction * speed

	move_and_slide()

func _process(delta):
	var mouse_direction: Vector2 = (get_global_mouse_position() - position)
	
	if	mouse_direction.x > 0 and animation_node.flip_h:
		animation_node.flip_h = false
	elif mouse_direction.x < 0 and not animation_node.flip_h:
		animation_node.flip_h = true

	sword_node.rotation = mouse_direction.angle()
	if sword_node.scale.y == 1 and mouse_direction.x <0:
		sword_node.scale.y = -1
	elif sword_node.scale.y == -1 and mouse_direction.x > 0:
		sword_node.scale.y = 1
