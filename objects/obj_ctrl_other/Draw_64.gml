

if (global.pause) {
	
	var _l = global.sunlight_current;
	draw_sprite_ext(spr_background_map, _l, 0, 0, global.view_width, global.view_height, 0, c_white, 1);
	
	draw_sprite(spr_map_grid_160x160, 0, global.view_width/2, global.view_height/2);
	

	var inc = grid_square_width;
	//middle of the room, to the left edge of the map, offset by the sprite size
	var left = (global.view_width / 2) - (sprite_get_width(map_spr) / 2);
	var top = (global.view_height / 2) - (sprite_get_height(map_spr) / 2);
	
	for (var i = 0; i <= global.sunbox_count; i++) {

		var _x = i * inc + left;
		var _x2 = (i + 1) * inc + left;
		var _y = top;
		var _y2 = _y + sprite_get_height(map_spr) - 1;
		var light = global.sunbox[i, 2];
		
		draw_set_color(c_black);
		draw_set_alpha(light/global.sunlight_max);
		draw_rectangle(_x, _y, _x2, _y2, false);
		draw_set_color(c_white);
		draw_set_alpha(1);
	
	
	}
	
}

