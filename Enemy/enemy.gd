extends CharacterBody2D

@export
var SPEED:float = 100

@export
var max_hp:int = 2

@export
var damage:int = 1

@export
var movement_target:Node2D

@export
var navigation_agent: NavigationAgent2D

@export
var sprite:AnimatedSprite2D

var hp:int
@onready
var char_animaiton:AnimatedSprite2D = get_node("AnimatedSprite2D")

@onready
var navigation

var is_flipped:bool = false
var is_dead:bool = false

func _ready():
	hp = max_hp
	char_animaiton.play('default')
	navigation_agent.path_desired_distance = 17
	navigation_agent.target_desired_distance = 17
	makepath()
# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	var dir = to_local(navigation_agent.get_next_path_position()).normalized()
	if !navigation_agent.is_navigation_finished() && !is_dead:
		if dir.x < 0 && !is_flipped:
			is_flipped = true
			char_animaiton.flip_h = true
		elif dir.x > 0 && is_flipped:
			is_flipped = false
			char_animaiton.flip_h = false
		velocity = dir * SPEED
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	
func makepath():
	navigation_agent.target_position = movement_target.global_position
	
func take_damage(damage):
	hp -= damage
	var knockback_dir = -velocity
	velocity = knockback_dir * 20
	move_and_slide()
	
	if	hp <= 0:
		is_dead = true
		char_animaiton.play("death")
		
		
	
func _on_timer_timeout():
	if !is_dead:
		makepath()



func _on_area_2d_body_entered(body):
	print("collision")

func _on_animated_sprite_2d_animation_looped():
	if is_dead:
		queue_free()
