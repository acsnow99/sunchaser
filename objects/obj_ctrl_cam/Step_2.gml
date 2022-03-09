


#macro view view_camera[0]


if (!levels_initiated) {
	
	levels_init();
	
}



camera_set_view_size(view, global.view_width, global.view_height);

if (instance_exists(focus_obj) && levels_initiated) {
	
	
	var _focusx = focus_obj.x;
	var _focusy = focus_obj.y;
	
	
	//	check which level the player is in if they are moving
	if (room_start || obj_player.x != obj_player.xprevious || obj_player.y != obj_player.yprevious) {
	
		level_seek(_focusx, _focusy);
		room_start = false;
	
	}
	
	
	var _min_x = global.levels[global.level, 0];
	var _max_x = global.levels[global.level, 1];
	var _min_y = global.levels[global.level, 2];
	var _max_y = global.levels[global.level, 3];
	
	
	var _camera_focusx = _focusx - global.view_width / 2;
	var _camera_focusy = _focusy - global.view_height / 2;
	
	
	var _x = clamp(_camera_focusx, _min_x, _max_x - global.view_width);
	var _y = clamp(_camera_focusy, _min_y, _max_y - global.view_height);
	
	var _cur_x = camera_get_view_x(view);
	var _cur_y = camera_get_view_y(view);
	
	//camera switches super fast when the player is moving through a door or up stairs(room_change changes based on the player's room_change variable)
	if (focus_quick){
		var _spd = cam_spd_quick;
	}
	else{
		var _spd = cam_spd_normal;
	}
	
	camera_set_view_pos(view, round(lerp(_cur_x, _x, _spd)), round(lerp(_cur_y, _y, _spd)));
	
}
	