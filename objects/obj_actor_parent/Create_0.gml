
mve_spd = 200;
mve_dir = 0;

start_movement = function(spd, dir, time) {
	
	mve_spd = spd;
	mve_dir = dir;
	
	alarmvar_mve = time;
	
	mve_state = 1;
	
}

movement = function() {
	
	if (alarmvar_mve <= 0) {
		
		end_movement();
		
	}
	
	
	mve_simple(mve_spd, mve_dir);
	
	alarmvar_mve -= global.dt_steady;
	
}

end_movement = function() {
	
	mve_state = 0;
	global.cutscene_moment += 1;
	
}

