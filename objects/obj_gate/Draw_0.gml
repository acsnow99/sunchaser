
if (open) {

	if (alarmvar_frame_end <= 0) {
	
		frame++;
	
		if (frame > anim_end) {
		
			frame = anim_begin;
		
		}
	
		alarmvar_frame_end = alarmvar_anim_default;
	
	}
	
	alarmvar_frame_end -= global.dt_steady;

}


draw_sprite_ext(spr_current, frame, x, y, 1, 1, 0, c_white, 1);

