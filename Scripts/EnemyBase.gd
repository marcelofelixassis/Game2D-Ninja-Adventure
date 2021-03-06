extends KinematicBody2D
class_name enemyBase

export var speed = 32
export var healt = 1
var motion = Vector2.ZERO
var move_direction = -1
var gravity = 1200
var hitted = false

func _physics_process(_delta: float):
	motion.x = speed * move_direction
	
	if move_direction == 1:
		$texture.flip_h = true
	else:
		$texture.flip_h = false
	
	_set_animation()
	
	motion = move_and_slide(motion)

func apply_gravity(delta):
	motion.y += gravity * delta

func _on_anim_animation_finished(anim_name):
	if(anim_name == "idle"):
		$ray_wall.scale.x *= -1
		move_direction *= -1
		$anim.play("run")

func _set_animation():
	var anim = "run"
	
	if $ray_wall.is_colliding():
		anim = "idle"
	elif motion.x != 0:
		anim = "run"
	
	if hitted:
		anim = "hit"
	
	if $anim.assigned_animation != anim:
		$anim.play(anim)

func _on_hitbox_body_entered(body: Node):
	hitted = true
	healt -= 1
	body.velocity.y = body.jump_force / 2
	$hitFx.play()
	yield(get_tree().create_timer(0.2), "timeout")
	hitted = false
	if healt < 1:
		queue_free()
		get_node("hitbox/collision").set_deferred("disabled", true)
