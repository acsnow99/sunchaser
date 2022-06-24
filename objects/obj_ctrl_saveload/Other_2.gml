
if (!file_exists("savedata")) {
	
	scr_save_value(global.save_file_name, global.save_vars[0], rm_level);
	scr_save_value(global.save_file_name, global.save_vars[1], global.savepoints[0]);
	
}

