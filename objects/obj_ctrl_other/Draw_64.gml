

if (global.pause) {
	
	var _l = global.sunlight_current;
	draw_sprite_ext(spr_background_map, _l, 0, 0, global.view_width, global.view_height, 0, c_white, 1);
	
	draw_sprite(spr_map_grid_160x160, 0, global.view_width/2, global.view_height/2 + 24);
	
	
	for (var i = 0; i < global.sunbox_count; i++) {

		var _x = i * 32 + 64;
		var light = global.sunbox[i, 2];
		
		draw_sprite_ext(spr_moon, light, _x, 18, 1, 1, 0, c_white, 1);
	
	
	}
	
}

