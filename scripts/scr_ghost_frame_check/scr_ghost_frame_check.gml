// @function ghost_frame_check
// @param alarmvar_inv
// @param alarmvar_ghost_frame
// @param alarmvar_ghost_frame_default


function ghost_frame_check(alarmvar_inv, alarmvar_ghost_frame, alarmvar_ghost_frame_default){

	if (alarmvar_inv > 0) {
	
		alarmvar_ghost_frame -= global.dt_steady;
	
		if (alarmvar_ghost_frame <= 0) {
			image_alpha = 0;
	
			return alarmvar_ghost_frame_default;
		}
		else {
		
			image_alpha = 1;
			
			return alarmvar_ghost_frame;
		
		}
	
	}
	else {
	
		image_alpha = 1;
		
		return alarmvar_ghost_frame;
	
	}

}