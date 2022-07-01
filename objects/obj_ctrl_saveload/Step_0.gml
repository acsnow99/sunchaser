
if (!instance_exists(obj_player)) { exit; }


	
	//savepoint code
	for (var i = 0; i < instance_number(obj_autosavepoint); i++) {
	
		var o = instance_find(obj_autosavepoint, i);
	
		with (o) {
			
			var m = place_meeting(x, y, obj_player)
			
			if (!other.autosaved) {
			
				if (m) {
			
					other.autosaved = scr_save_all(global.save_file);
					scr_save_value(global.save_file, global.save_vars[1], o);
					
				}	
	
			}
			else if (!m) {
				
				other.autosaved = false;
				
			}
			
		
		}
	
	}
	

