

if (global.pause) {
	
	var _l = global.sunlight_current;
	draw_sprite_ext(spr_background_map, _l, 0, 0, global.view_width, global.view_height, 0, c_white, 1);
	
	draw_sprite(spr_map_grid_160x160, 0, global.view_width/2, global.view_height/2 + 24);
	
	
	//var inc = (sprite_get_width(map_spr) - sprite_get_width(spr_moon))/global.sunbox_count;
	var inc = 24;
	//middle of the room, to the left edge of the map, offset by the sprite size
	//var left = (global.view_width / 2) - (sprite_get_width(map_spr) / 2) + (sprite_get_width(spr_moon) / 2);
	var left = 16;
	
	for (var i = 0; i < global.sunbox_count; i++) {

		var _x = i * inc + left;
		var light = clamp(global.sunbox[i, 2], 0, sprite_get_number(spr_moon));
		
		draw_sprite_ext(spr_moon, light, _x, 18, 1, 1, 0, c_white, 1);
	
	
	}
	
}

