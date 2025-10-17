extends CharacterBody2D

#signal hurt(damage)

const SPEED = 40.0
@onready var sprite = $Sprite2D


func _physics_process(delta: float) -> void:
	movement()

func movement() -> void:
	
	var x_move = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_move = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	var move = Vector2(x_move, y_move)
	
	if x_move != 0:
		sprite.flip_h = x_move < 0
	
	velocity = move.normalized() * SPEED
	
	move_and_slide()


func take_damage(damage: int) -> void:
	print(damage)

func _on_hurtbox_area_entered(area: Area2D) -> void:
	if not area.is_in_group("bad_things"):
		return # Replace with function body.
	
	if not area.get("damage"):
		return
		
	#emit_signal("hurt", area.get("damage"))
	take_damage(area.get("damage"))
	
	if area.has_method("on_hit"):
		area.on_hit()
