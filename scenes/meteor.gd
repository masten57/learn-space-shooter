extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float

func _ready():
	var rng := RandomNumberGenerator.new()
	
	# texture
	var path: String = "res://PNG/Meteors/meteorBrown_big" + str(rng.randi_range(1, 4)) + ".png"
	$Sprite2D.texture = load(path)
	
	# start position
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	position = Vector2(random_x, random_y)
	
	# speed/rotation/direction
	speed = rng.randi_range(200, 500)
	direction_x = rng.randf_range(-1, 1)
	rotation_speed = rng.randi_range(40, 100)

func _process(delta):
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta

func _on_body_entered(body):
	print('body entered')
	print(body)
	
