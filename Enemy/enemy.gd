extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready
var char_animaiton:AnimatedSprite2D = get_node("AnimatedSprite2D")

func _ready():
	char_animaiton.play('default')

# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	move_and_slide()
