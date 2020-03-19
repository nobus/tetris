extends Sprite

var speed = 50
var down_speed = 25
var sdelta = 0

var is_moving = true
var screen_height = int(ProjectSettings.get_setting("display/window/size/height"))

var timer

func set_timer():
	timer = rand_range(13, 33)
	$Timer.text = str(timer)

func _ready():
	set_timer()
	#print(ProjectSettings.get_setting("display/window/size/width"))
	#print(ProjectSettings.get_setting("display/window/size/height"))

func _physics_process(delta):
	timer -= delta
	$Timer.text = str(timer)

	if is_moving:
		sdelta += delta

		if sdelta > 1:
			#position.y += down_speed
			sdelta = 0
			#print(position.y)

		if Input.is_action_pressed("ui_right"):
			position.x += speed
		if Input.is_action_pressed("ui_left"):
			position.x -= speed
		if Input.is_action_pressed("ui_down"):
			position.y += speed

	if position.y >= screen_height-200:
		is_moving = false

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		if get_rect().has_point(get_local_mouse_position()):
			set_timer()
