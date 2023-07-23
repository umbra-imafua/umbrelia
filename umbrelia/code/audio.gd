extends Node

enum AudioBus { Master, Music, Voice, Sound }

# Master
func set_master_bus_volume_db(volume_db: float) -> void: _set_volume_db(AudioBus.Master, volume_db)
func set_master_bus_volume_linear(volume: float) -> void: _set_volume_db(AudioBus.Master, linear_to_db(volume))
func get_master_bus_volume_db() -> float: return _get_volume_db(AudioBus.Master)
func get_master_bus_volume_linear() -> float: return _get_volume_linear(AudioBus.Master)
# Music
func set_music_bus_volume_db(volume_db: float) -> void: _set_volume_db(AudioBus.Music, volume_db)
func set_music_bus_volume_linear(volume: float) -> void: _set_volume_db(AudioBus.Music, linear_to_db(volume))
func get_music_bus_volume_db() -> float: return _get_volume_db(AudioBus.Music)
func get_music_bus_volume_linear() -> float: return _get_volume_linear(AudioBus.Music)
# Voice
func set_vcoice_bus_volume_db(volume_db: float) -> void: _set_volume_db(AudioBus.Voice, volume_db)
func set_voice_bus_volume_linear(volume: float) -> void: _set_volume_db(AudioBus.Voice, linear_to_db(volume))
func get_voice_bus_volume_db() -> float: return _get_volume_db(AudioBus.Voice)
func get_voice_bus_volume_linear() -> float: return _get_volume_linear(AudioBus.Voice)
# Sound
func set_sound_bus_volume_db(volume_db: float) -> void: _set_volume_db(AudioBus.Sound, volume_db)
func set_sound_bus_volume_linear(volume: float) -> void: _set_volume_db(AudioBus.Sound, linear_to_db(volume))
func get_sound_bus_volume_db() -> float: return _get_volume_db(AudioBus.Sound)
func get_sound_bus_volume_linear() -> float: return _get_volume_linear(AudioBus.Sound)

# Functions
func _set_volume_db(bus: AudioBus, volume_db: float) -> void:
	AudioServer.set_bus_volume_db(_get_bus_index(bus), volume_db)
func _get_volume_db(bus: AudioBus) -> float:
	return AudioServer.get_bus_volume_db(_get_bus_index(bus))
func _get_volume_linear(bus: AudioBus) -> float:
	return db_to_linear(_get_volume_db(bus))
func _get_bus_key(bus: AudioBus) -> String:
	return AudioBus.keys()[bus]
func _get_bus_index(bus: AudioBus) -> int:
	return AudioServer.get_bus_index(_get_bus_key(bus))
