extends Area2D

export var fruit_score = 1

func _on_items_body_entered(body):
	if body.name == "Player":
		$anim.play("collected")
		Global.score += fruit_score

func _on_anim_animation_finished(anim_name):
	if anim_name == "collected":
		queue_free()
