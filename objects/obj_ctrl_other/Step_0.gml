

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
	
	game_restart();
	
}


for (var i = 0; i < instance_number(obj_enemy_parent); i++) {
	
	var o = instance_find(obj_enemy_parent, i);
	
	if (o.health_current < o.health_last) {

		if (global.combo < 3) {
				
			global.combo += 1;
				
		}
		
		o.health_last = o.health_current;
		
	}
			
}

if (global.combo >= 3) {
	
	if (health < global.health_max - 1) {
		
		health += 10;
		global.combo = 0;
		
	}
	
}


