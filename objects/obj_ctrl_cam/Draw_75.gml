//@description draw UI to the screen

if (in_level) {

	draw_sprite_ext(spr_hud_background, 0, 0, 0, 1, 1, 0, c_white, 1);


	var _h = health / 10;

	draw_sprite_ext(spr_hud_healthbar, _h, 0, 0, 1, 1, 0, c_white, 1);
	
	var _i = player_position_update();
	
	draw_sprite_ext(spr_hud_sunmeter, _i, global.view_width, 0, 1, 1, 0, c_white, 1);
	
	
	//combo meter(for use with the sword only)
	if (global.item_equipped == 1) {
		draw_sprite_ext(spr_hud_lightboost_meter, global.combo, 0, 0, 1, 1, 0, c_white, 1);
		draw_rectangle_color(40, height_healthbar, 40 + 40 * (obj_ctrl_progress.alarmvar_combo_end/obj_ctrl_progress.alarmvar_combo_end_default), height_healthbar + 16, c_yellow, c_yellow, c_yellow, c_yellow, false);
		
	}
	
	
	draw_sprite_ext(spr_icon_lightcrystal, 0, 32 + width_meter, height_healthbar, 0.5, 0.5, 1, c_white, 1);
	draw_text(64 + width_meter, height_healthbar + 16, string(global.currency));
	
	
	//item equipped icon
	var is = item_sprites[global.item_equipped];
	var d = sprite_get_width(item_sprites[global.item_equipped]) + 64;
	
	draw_sprite_ext(spr_hud_item_background, 0, global.view_width - d, global.view_height - d, 1, 1, 0, c_white, 1);
	draw_sprite_ext(is, 0, global.view_width - d, global.view_height - d, 1, 1, 0, c_white, 1);
	
	
	//change background based on the sunlight
	/*
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	layer_background_sprite(back_id, colors[global.sunlight_current]);
	*/
	
	
	//doesn't show up for some reason, but did before. Something is drawing over it?
	if (obj_ctrl_saveload.autosaved) {
		
		draw_text(400, global.view_height - 300, "Game Saved");
		
	}
	
	
	
	if (global.debug) {
		draw_text(20, 40, obj_ctrl_daylight.alarmvar_sunset);
		draw_text(20, 60, global.sunbox_current);
		draw_text(20, 80, global.sunlight_current);
		draw_text(20, 100, global.sunlight_level);
		draw_text(20, 120, global.level);
		draw_text(20, 140, obj_player.x);
		draw_text(20, 160, obj_player.y);
		draw_text(20, 180, global.gp_num);
		draw_text(20, 200, global.gamepad);
		draw_text(20, 220, global.save_file_name);
	}
	
}

