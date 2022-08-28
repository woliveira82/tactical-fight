extends ColorRect


func _on_Button_button_up():
	SceneDirector.change_to("res://src/game/v1/scenes/Battleground.tscn")


func _on_Version2_button_up():
	SceneDirector.change_to("res://src/game/v2/scenes/Battleground.tscn")
