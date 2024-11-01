extends CanvasLayer

func _physics_process(_delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		var keyevent = event as InputEventKey
		if keyevent.pressed:
			match keyevent.keycode:
				KEY_H:
					if visible: hide()
					else: show()
				KEY_S:
					print("screenshot!")
					await get_tree().process_frame
					var capture = get_viewport().get_texture().get_image()
					var capturebuf : PackedByteArray = capture.save_jpg_to_buffer()
					var _bufsize : int = capturebuf.size()
					
					var now = Time.get_datetime_dict_from_system()
					#Returns the current date as a dictionary of keys: year, month, day,
					#weekday, hour, minute, second, and dst (Daylight Savings Time).
					var run_start_time_label = "%04d%02d%02d-%02d-%02d-%02d" % [
						now['year'],now['month'] ,now['day'],
						now['hour'],now['minute'],now['second'],
					]
					
					#var _time = Time.get_datetime_string_from_system()
					var file : FileAccess = FileAccess.open(
						"capture/%s.jpg" % [run_start_time_label],
						FileAccess.WRITE
					)
					if file:
						file.store_buffer(capturebuf)
						#var filename = "res://captures/Screenshot-{0}.png".format({"0":_time})
						#capture.save_png(filename)
						file.close()
					else:
						prints("save failed. reason: ",FileAccess.get_open_error())
