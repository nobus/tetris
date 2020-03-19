extends RigidBody2D

var timer

func _ready():
	pass

func _physics_process(delta):
	if $square.timer <= 0:
		self.queue_free()
