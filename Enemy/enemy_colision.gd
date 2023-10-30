extends CollisionShape2D

@export var damage:int = 1
@export var knockback_force:int = 300

var knockback_direction: Vector2 = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_child_entered_tree(node):
	print("connected")
	print(node)
	pass # Replace with function body.
