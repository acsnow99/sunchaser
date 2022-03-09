


if (room == rm_level) {
	
	global.alarmvar_runtime += global.dt_steady;
	
}
else {
	
	global.alarmvar_runtime = 0;
	
}

if (health <= 0) {
	
	game_restart();
	
}


