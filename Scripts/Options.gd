extends Control


var bus_index: int


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_VolSlid_value_changed(value):
	bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, value)
