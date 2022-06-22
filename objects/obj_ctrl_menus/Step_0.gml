
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
