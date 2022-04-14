

if (global.pause) {
	
	if (!deactivated) {
		
		instance_deactivate_all(true);
		instance_activate_object(obj_ctrl_inputs);
		deactivated = true;
		
	}
	
}
else {
	
	instance_activate_all();
	deactivated = false;
	
}


if (room == rm_level) {
	
	global.alarmvar_runtime += global.dt_steady;
	
}
else {
	
	global.alarmvar_runtime = 0;
	
}

if (health <= 0) {
	
	restart_level();
	
}


