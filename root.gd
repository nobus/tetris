extends Node2D


var square_scene = preload("res://RigidBody2DSquare.tscn")
var sum_delta = 0
var n = 0


func create_square(n):
	var square = square_scene.instance()
	square.set_name('square_' + str(n))
	square.position = Vector2(rand_range(-500, 100), 0)
	add_child(square)
	print('Square number ' + str(n))
		
func _ready():
	create_square(n)
	n += 1

func _physics_process(delta):
	sum_delta += delta
	
	if sum_delta >= 3:
		create_square(n)
		n += 1		
		sum_delta = 0
		

