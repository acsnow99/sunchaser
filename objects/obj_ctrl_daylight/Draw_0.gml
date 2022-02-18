
if (global.debug) {
	
	var _cur_x = camera_get_view_x(view);
	var _cur_y = camera_get_view_y(view);
	var _a = -global.sunlight_current/sunlight_max;

	draw_sprite_ext(spr_hb_player_atk_basic, 0, _cur_x + 600, _cur_y + 100, 2, 2, 45, c_black, clamp(_a, 0, 1));
	
	draw_text(_cur_x + 20, _cur_y + 50, alarmvar_sunset);
	draw_text(_cur_x + 20, _cur_y + 100, global.sunlight_current);
	
}

