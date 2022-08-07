extends CanvasLayer

var scene_name: String


func _ready():
	$ColorRect.self_modulate.a = 0.0


func change_to(new_scene_name):
	scene_name = new_scene_name
	$AnimationPlayer.play('fade')


func _new_scene():
	var value = get_tree().change_scene(scene_name)
