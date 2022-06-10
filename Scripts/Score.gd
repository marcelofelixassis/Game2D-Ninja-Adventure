extends Label

func _process(_delta: float) -> void:
	text = "000" + String(Global.score)
	if Global.score >= 10:
		text = "00" + String(Global.score)
	if Global.score >= 100:
		text = String(Global.score)
