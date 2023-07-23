extends Node2D

func _ready():
	game.Root = self
	game.Music = get_node("Music")
	
	game._start()
