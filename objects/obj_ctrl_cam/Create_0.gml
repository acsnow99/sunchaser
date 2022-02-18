/// @description Object controls camera
//See obj_camera in Eclipse files for more source code

//camera
global.view_width = 1152/4;
global.view_height = 768/4;
global.window_scale = 1;

window_set_size(global.view_width*global.window_scale, global.view_height*global.window_scale);
surface_resize(application_surface, global.view_width*global.window_scale, global.view_height*global.window_scale);
window_set_fullscreen(true);

//object on which to focus the camera
focus_obj = obj_player;
focus_quick = false;

cam_spd_normal = 0.75;
cam_spd_quick = 1;



levels_init = function() {

	for (var i = 0; i < instance_number(obj_level_frame); i++) {
	
		var _this_frame = instance_find(obj_level_frame, i);
	
		//mins and maxes for each level's camera reach
		global.levels[i, 0] = _this_frame.x;
		global.levels[i, 1] = global.levels[i, 0] + _this_frame.sprite_width;
		global.levels[i, 2] = _this_frame.y;
		global.levels[i, 3] = global.levels[i, 2] + _this_frame.sprite_height;
	
	
	}
	
	levels_initiated = true;

}



level_seek = function(_focusx, _focusy) {
	
	for (var i = 0; i < instance_number(obj_level_frame); i++) {
		
		var _min_x = global.levels[i, 0];
		var _max_x = global.levels[i, 1];
		
		var _min_y = global.levels[i, 2];
		var _max_y = global.levels[i, 3];
		
		if (_focusx >= _min_x && _focusx <= _max_x && _focusy >= _min_y && _focusy <= _max_y) {
			
			// set originally in obj_control_other
			global.level = i;
			exit;
		
		}
		
	}
	
}




// initiate the level boundaries using the above function
levels_initiated = false;

if (instance_exists(obj_level_frame)) {

	levels_init();
	
}

