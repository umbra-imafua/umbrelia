extends AudioStreamPlayer

var sec_per_beat = 60.0 / game.bpm
var last_reported_beat = 0
var beats_before_start = 0

signal beat(position)
signal measure(position)

func _ready(): sec_per_beat = 60.0 / game.bpm

func _physics_process(_delta):
	if playing:
		game.songpos = get_playback_position() + AudioServer.get_time_since_last_mix()
		game.songpos -= AudioServer.get_output_latency()
		
		game.beat = int(floor(game.songpos / sec_per_beat)) + beats_before_start
		game.measure = game.beat % game.measures
		game.blerp = 1-($StartTimer.get_time_left()/$StartTimer.wait_time)
		
		
		_report_beat()

func _report_beat():
	if last_reported_beat < game.beat:
		emit_signal("beat", game.beat)
		emit_signal("measure", game.measure)
		last_reported_beat = game.beat



func play_with_beat_offset(num):
	beats_before_start = num
	$StartTimer.wait_time = sec_per_beat
	$StartTimer.start()

func play_from_beat(beat, offset):
	play()
	seek(beat * sec_per_beat)
	beats_before_start = offset
	game.measure = beat % game.measures

func _on_StartTimer_timeout():
	game.beat += 1
	if game.beat < beats_before_start - 1:
		$StartTimer.start()
	elif game.beat == beats_before_start - 1:
		$StartTimer.wait_time = $StartTimer.wait_time - (AudioServer.get_time_to_next_mix() +
														AudioServer.get_output_latency())
		$StartTimer.start()
	else:
		play()
		$StartTimer.stop()
	_report_beat()

### USE FOR RYTHM ACCURACY DETECTION closest_beat(x) WHERE x IS MULTIPLE TO CHECK
func closest_beat(nth):
	var closestfind = int(round((game.songpos / sec_per_beat) / nth) * nth) 
	var time_off_beat = abs(closestfind * sec_per_beat - game.songpos)
	return Vector2(closestfind, time_off_beat)
