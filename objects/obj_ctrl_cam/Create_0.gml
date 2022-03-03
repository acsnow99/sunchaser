/// @description view setup - size
//See obj_camera in Eclipse files for more source code

//camera
global.view_width = 1080/4;
global.view_height = 720/4;
global.window_scale = 1;

window_set_size(global.view_width*global.window_scale, global.view_height*global.window_scale);
surface_resize(application_surface, global.view_width*global.window_scale, global.view_height*global.window_scale);
window_set_fullscreen(true);
camera_set_view_size(view_camera[0], global.view_width*global.window_scale, global.view_height*global.window_scale);



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
