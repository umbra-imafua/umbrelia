@icon("res://path/to/optional/icon.svg")
class_name MyClass # (optional) class definition:
extends Node

var a = 5
var arr = [1, 2, 3]
var dict = {"key": "value", 2: 3}
var other_dict = {key = "value", other_key = 2}
var typed_var: int
var inferred_type := "String"

const THE_NAME = "Charly"

var v2 = Vector2(1, 2)
var v3 = Vector3(1, 2, 3)

enum {UNIT_NEUTRAL, UNIT_ENEMY, UNIT_ALLY}
enum Named {THING_1, THING_2, ANOTHER_THING = -1}

func some_function(param1, param2, param3):
	const local_const = 5
	
	var local_var = param1 + 3
	return local_var
	
	if param1 < local_const:
		print(param1)
	elif param2 > 5:
		print(param2)
	else:
		print("Fail!")
	
	for i in range(20):
		print(i)
	
	while param2 != 0:
		param2 -= 1
	
	match param3:
		3:
			print("param3 is 3!")
		_:
			print("param3 is not 3!")

func _snippets(value,value1,value2,value3,value4):	
	#master,music,voice,sound
	audio.set_master_bus_volume_db(value)
	audio.set_music_bus_volume_linear(value)
	audio.get_voice_bus_volume_db()
	audio.get_sound_bus_volume_linear()
	
	game.
