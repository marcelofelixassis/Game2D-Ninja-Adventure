extends Area2D

func _on_fallzone_body_entered(body):
	if(body.name == "Player"):
		# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
