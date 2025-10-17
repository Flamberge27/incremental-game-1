extends Area2D



@onready var sprite = $Sprite2D
@onready var timer = $Timer
@onready var player = get_tree().get_first_node_in_group("player")

var angle = Vector2.ZERO
var speed = 50.0

var damage = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_angle(global_position.direction_to(player.global_position))
	pass # Replace with function body.

func update_angle(direction: Vector2) -> void:
	angle = direction
	rotation = direction.angle()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	position += speed * angle * delta

func _on_timer_timeout() -> void:
	sprite.frame = (sprite.frame + 1) % sprite.vframes
	
func on_hit():
	queue_free()
	pass
