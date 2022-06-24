/// @description view setup - size
//See obj_camera in Eclipse files for more source code

//camera
global.view_width = 1080;
global.view_height = 720;
global.window_scale = 1;

window_set_size(global.view_width*global.window_scale, global.view_height*global.window_scale);
surface_resize(application_surface, global.view_width*global.window_scale, global.view_height*global.window_scale);
display_set_gui_size(global.view_width*global.window_scale, global.view_height*global.window_scale);
window_set_fullscreen(true);
camera_set_view_size(view_camera[0], global.view_width, global.view_height);


depth = -1;

_x = 0;
_y = 0;


height_healthbar = sprite_get_height(spr_healthbar);
width_meter = sprite_get_width(spr_lightboost_meter);
height_meter = sprite_get_height(spr_lightboost_meter);
height_lightcrystal = sprite_get_width(spr_lightcrystal);


item_sprites[0] = spr_placeholder;
item_sprites[1] = spr_icon_sword;
item_sprites[2] = spr_icon_sun_lantern;




player_position_update = function() {
	
	var _s = 0;
	var box_left = global.sunbox_current - 1;
	if (box_left < 0) {
		box_left = global.sunbox_count;
	}
	var box_right = global.sunbox_current + 1;
	if (box_right > global.sunbox_count) {
		box_right = 0;
	}
	if (global.sunlight_current >= global.sunlight_max) {
		
		_s = 4;
		
	}
	else if (global.sunlight_current <= 0 && global.sunbox[box_right, 2] <= 0)  {
		
		_s = 0;
		
	}
	else if (global.sunlight_current == 1 && global.sunbox[box_right, 2] <= 0)  {
		
		_s = 0;
		
	}
	else {
		
		var _f = obj_ctrl_daylight.alarmvar_sunset < obj_ctrl_daylight.sunset_spd/2;
		_s = _f + (global.sunlight_current * 2);
		
	}
	
	return _s;
	
}

