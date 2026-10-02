extends Sprite2D

var bob_up = true
var bob_speed = 1
var bob_distance = 20
var bob_center = 200

@export var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		
	if Input.is_action_pressed("ui_right"):
		flip_h = false
		position.x += speed
		
	if Input.is_action_pressed("ui_left"):
		flip_h = true
		position.x -= speed
		
	if Input.is_action_pressed("ui_up"):
		position.y -= speed
		bob_center = position.y
		
	if Input.is_action_pressed("ui_down"):
		position.y += speed
		bob_center = position.y
		
	if !Input.is_anything_pressed():
		bob()
		
		
# function to bob the character up and down when no up down input
func bob():
	
	if bob_up:
		position.y -= bob_speed
	else:
		position.y += bob_speed
	
	if position.y < bob_center - bob_distance:
		bob_up = false
	if position.y > bob_center + bob_distance:
		bob_up = true
