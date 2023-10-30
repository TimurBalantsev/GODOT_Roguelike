extends Node2D

@export
var tile_map:TileMap


func _init():
	var screen_size:Vector2 = DisplayServer.screen_get_size()
	var window_size:Vector2 = DisplayServer.window_get_size()
	DisplayServer.window_set_size(screen_size * 0.5)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
