
if (!instance_exists(obj_player)) { exit; }


//savepoint code
for (var i = 0; i < instance_number(obj_autosavepoint); i++) {
	
	var o = instance_find(obj_autosavepoint, i);
	
	with (o) {
	
		if (place_meeting(x, y, obj_player)) {
	
			scr_save_all(global.save_file);
	
		}
		
	}
	
}

