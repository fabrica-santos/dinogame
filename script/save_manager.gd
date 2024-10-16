extends Node

const SAVEPATH: String = "user://save.tres"


func load_save() -> GameState:
	var save_resource: GameState = ResourceLoader.load(SAVEPATH, "GameState")
	return save_resource


func write_save(game_state: GameState) -> void:
	ResourceSaver.save(game_state, SAVEPATH)


func delete_save() -> void:
	var dir_access: DirAccess = DirAccess.open("user://")
	if dir_access.file_exists("save.tres"):
		dir_access.remove("save.tres")
		print("deleted save")
	else:
		print("save file doesn't exist")
