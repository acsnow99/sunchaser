
//variable in create event tells object to overwrite old save
if (!file_exists("savedata") || overwrite) {
	
	for (var i = 0; i < save_file_count; i++) {

		scr_save_all(i, global.savepoints[0], rm_level);
		
	}
	
}

