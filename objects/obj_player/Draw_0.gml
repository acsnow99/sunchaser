/// @description 
if (!enabled) exit;

var sprite = dir_last;
//set the index to the current sunlight level(for color), offset by the length of the animation
image_index = global.sunlight_current * animation_length_current + (colors_count * sprite) + animation_pos;


if (alarmvar_inv > 0) {
	
	alarmvar_ghost_frame -= global.dt_steady;
	
	if (alarmvar_ghost_frame <= 0) {
		image_alpha = 0;
	
		alarmvar_ghost_frame = alarmvar_ghost_frame_default;
	}
	else {
		
		image_alpha = 1;
		
	}
	
}
else {
	
	image_alpha = 1;
	
}

depth = -y;

draw_sprite_ext(spr_current, image_index, x, y, image_xscale, image_yscale, 0, c_white, image_alpha);

