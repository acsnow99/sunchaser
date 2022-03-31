// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_lvl_check(_focusx, _focusy) {
	
	for (var i = 0; i < instance_number(obj_level_frame); i++) {
		
		var _min_x = global.levels[i, 0];
		var _max_x = global.levels[i, 1];
		
		var _min_y = global.levels[i, 2];
		var _max_y = global.levels[i, 3];
		
		if (_focusx >= _min_x && _focusx <= _max_x && _focusy >= _min_y && _focusy <= _max_y) {
			
			// set originally in obj_control_other
			return i;
			exit;
		
		}
		
	}
	
}