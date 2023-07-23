extends Node2D

var debugfont = load("res://ui/fonts/openpixlexic.ttf")

func _process(delta):
	queue_redraw()

func _draw():
	draw_string(debugfont,Vector2(32,32),str(game.debug1))
	draw_string(debugfont,Vector2(32,64),str(game.debug2))
	draw_string(debugfont,Vector2(32,96),str(game.debug3))
	draw_string(debugfont,Vector2(32,128),str(game.debug4))
	draw_string(debugfont,Vector2(32,160),str(game.debug5))
