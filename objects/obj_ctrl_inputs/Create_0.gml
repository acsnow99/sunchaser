






check_gamepads = function() {
	
	gp_num = gamepad_get_device_count();
	
	for (var i = 0; i < gp_num; i++;)
	{
		
		global.gp[i] = false;
		
	    if (gamepad_is_connected(i)) {
			global.gp[i] = true;
		}
		
	}
	
}


assign_inputs = function() {
	
	global.mve_inputs[0] = ord("D");
	global.mve_inputs[1] = ord("W");
	global.mve_inputs[2] = ord("A");
	global.mve_inputs[3] = ord("S");

	//button to activate special attack
	global.atk_input_sp = 	ord("E");
	//button to activate normal attack
	global.atk_input_basic = vk_space;
	
}


