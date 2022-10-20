tool
extends EditorPlugin

const EXPORT_PRESETS_PATH = 'res://export_presets.cfg'
const EXPORT_PRESET_SETTING = 'editor/export_preset_on_save'

var do_export := false

func _enter_tree() -> void:
	connect("resource_saved", self, "_on_resource_saved")
	_setup_project_settings()

func _exit_tree() -> void:
	disconnect("resource_saved", self, "_on_resource_saved")

func _get_export_presets() -> Array:
	var ret := []
	
	var file := File.new()
	if not file.file_exists(EXPORT_PRESETS_PATH):
		return ret
	
	if file.open(EXPORT_PRESETS_PATH, File.READ) != OK:
		push_error("Unable to open %s" % EXPORT_PRESETS_PATH)
		return ret
	
	while not file.eof_reached():
		var line := file.get_line()
		if line.find("name=") == 0:
			ret.append(line.substr(6, line.length() - 7))
	
	return ret

func _setup_project_settings() -> void:
	var export_preset_options: String = ',' + PoolStringArray(_get_export_presets()).join(",")
	_add_project_setting(EXPORT_PRESET_SETTING, TYPE_STRING, "", PROPERTY_HINT_ENUM, export_preset_options)

func _add_project_setting(name: String, type: int, default, hint = null, hint_string = null) -> void:
	if not ProjectSettings.has_setting(name):
		ProjectSettings.set_setting(name, default)
	
	ProjectSettings.set_initial_value(name, default)
	
	var info := {
		name = name,
		type = type,
	}
	if hint != null:
		info['hint'] = hint
	if hint_string != null:
		info['hint_string'] = hint_string
	
	ProjectSettings.add_property_info(info)

func _on_resource_saved(resource: Resource) -> void:
	do_export = true
	call_deferred("_export")

func _export() -> void:
	if not do_export:
		return
	do_export = false
	
	# Update list of export presets.
	_setup_project_settings()
	
	var preset_name = ProjectSettings.get_setting(EXPORT_PRESET_SETTING)
	if not preset_name:
		return
	
	var args = [
		'--no-window',
		'--export',
		preset_name,
	]
	var output = []
	var exit_code = OS.execute(OS.get_executable_path(), args, true, output)
	
	if exit_code != 0:
		OS.alert(" !! Error exporting: %s" % preset_name)
		print (output)
	else:
		print (" ** SUCCESSFULLY EXPORTED: %s" % preset_name)
