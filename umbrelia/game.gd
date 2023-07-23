extends Node
var Root; var Music
var debug1 = "init";var debug2 = " ";var debug3 = " ";var debug4 = " ";var debug5 = " ";
#---------------(OxO)---------------- 
var frame: int = 0
var pframe: int = 0
#---------------('')---------------- 
var bpm = 106
var measures = 4
#--------------(#^.^#)--------------- 
var songpos = 0.0
var beat: int = 0
var measure = 0
var blerp: float = 0
#---------------('w')---------------- 

func _start():
	Music.play_with_beat_offset(0)

func _process(delta):
	frame += 1
	
	debug1 = snapped(songpos,0.001)
	debug2 = beat
	debug3 = measure
	debug4 = snapped(blerp,0.001)

func  _physics_process(delta):
	pframe += delta
