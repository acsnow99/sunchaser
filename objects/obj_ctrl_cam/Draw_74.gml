//@description draw UI to the screen

if (in_level) {

	var _h = health / 10;

	draw_sprite_ext(spr_healthbar, _h, 0, 0, 1, 1, 0, c_white, 1);
	
	if (global.item_equipped == 1) {
		
		//combo meter(for use with the sword only)
		draw_sprite_ext(spr_lightboost_meter, global.combo, 40, height_healthbar, 1, 1, 0, c_white, 1);
		
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


