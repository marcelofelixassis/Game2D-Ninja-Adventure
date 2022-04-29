extends Area2D

func _on_Trampoline_body_entered(body: Node):
	body.velocity.y = body.jump_force / 1.3
	$anim.play("jump")
