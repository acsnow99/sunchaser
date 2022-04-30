//@description draw UI to the screen

if (in_level) {

	var _h = health / 10;

	draw_sprite_ext(spr_healthbar, _h, 0, 0, 1, 1, 0, c_white, 1);
	
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
	
	draw_sprite_ext(spr_sunmeter, _s, global.view_width, 0, 1, 1, 0, c_white, 1);
	
	if (global.item_equipped == 1) {
		
		//combo meter(for use with the sword only)
		draw_sprite_ext(spr_lightboost_meter, global.combo, 40, height_healthbar, 1, 1, 0, c_white, 1);
		draw_rectangle_color(48, height_healthbar + height_meter, 40 + (width_meter - 8) * (obj_ctrl_progress.alarmvar_combo_end/obj_ctrl_progress.alarmvar_combo_end_default), height_healthbar + height_meter + 16, c_yellow, c_yellow, c_yellow, c_yellow, false);
		
	}
	
	draw_sprite_ext(spr_icon_lightcrystal, 0, 32 + width_meter, height_healthbar, 0.5, 0.5, 1, c_white, 1);
	draw_text(64 + width_meter, height_healthbar + 16, string(global.currency));
	
	draw_sprite_ext(spr_item_background, 0, global.view_width - 96, global.view_height - 96, 1, 1, 0, c_white, 1);
	draw_sprite_ext(item_sprites[global.item_equipped], 0, global.view_width - 96, global.view_height - 96, 1, 1, 0, c_white, 1);
	
	if (global.debug) {
		draw_text(20, 40, obj_ctrl_daylight.alarmvar_sunset);
		draw_text(20, 60, global.sunbox_current);
		draw_text(20, 80, global.sunlight_current);
		draw_text(20, 100, global.sunlight_level);
		draw_text(20, 120, global.level);
		draw_text(20, 140, obj_player.x);
		draw_text(20, 160, obj_player.y);
	}
	
}


