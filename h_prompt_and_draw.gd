extends HBoxContainer

func _physics_process(delta: float) -> void:
	if $cTarot/v/Label.text != '':
		$cPrompt/VBoxContainer/TextEdit.editable = false
		$cTarot/v/Button.disabled = true
		$cPrompt/VBoxContainer/Label.modulate.a *= 0.99
	elif len($cPrompt/VBoxContainer/TextEdit.text) < 10:
		$cTarot/v/Button.disabled = true
	else:
		$cTarot/v/Button.disabled = false # ok you can click now
