
if (room == rm_level) {
	
	global.alarmvar_runtime += global.dt_steady;
	
}
else {
	
	global.alarmvar_runtime = 0;
	
}



if (health <= 0) {
	
	restart_level();
	
}



if (global.item_equipped == 1) {
	
	combo_update();
	
}
else {
	
	combo_end();
	
}


