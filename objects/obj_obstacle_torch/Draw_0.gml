
if (lit) {

	if (alarmvar_anim <= 0) {
	
		animation_pos += 1;
	
		if (animation_pos > anim_end) {
		
			animation_pos = anim_begin;
		
		}
		
		alarmvar_anim = anim_time_default;
		
	}
	
	
	alarmvar_anim -= global.dt_steady;

}


image_index = global.sunlight_current * animation_length_current + animation_pos;

draw_sprite_ext(sprite_current, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1);


