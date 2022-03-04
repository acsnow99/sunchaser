//@description draw healthbar to the screen

if (in_level) {

	var _h = health / 10;

	draw_sprite_ext(spr_healthbar, _h, 8, 8, 1, 1, 0, c_white, 1);
	draw_sprite_ext(spr_lightboost_meter, global.combo, 8, 68, 1, 1, 0, c_white, 1);
	draw_text(20, 60, global.sunbox_count);
	
}


