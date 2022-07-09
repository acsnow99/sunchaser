

global.gp_num = 0;
global.gamepad = 0;
global.gp_active = false;




check_gamepads = function() {
	
	global.gp_num = gamepad_get_device_count();
	
	for (var i = 0; i < global.gp_num; i++;)
	{
		
		global.gp[i] = false;
		
	    if (gamepad_is_connected(i)) {
			global.gp[i] = true;
		}
		
	}
	
}


assign_inputs = function() {
	
	
	if (gamepad_is_supported()) {
		 
		for (var i = 0; i < global.gp_num; i++) {
		
			if (global.gp[i]) {
			
				global.gamepad = i;
				global.gp_active = true;
				exit;
			
			}
		
		}
	}
	
	
	if (global.gp_active) {
		
		global.mve_inputs[0] = gp_padr;
		global.mve_inputs[1] = gp_padu;
		global.mve_inputs[2] = gp_padl;
		global.mve_inputs[3] = gp_padd;

		//button to activate special attack
		global.atk_input_sp = gp_face3;
		//button to activate normal attack
		global.atk_input_basic = gp_face1;
	
	}
	else {
		
		global.mve_inputs[0] = ord("D");
		global.mve_inputs[1] = ord("W");
		global.mve_inputs[2] = ord("A");
		global.mve_inputs[3] = ord("S");

		//button to activate special attack
		global.atk_input_sp = 	ord("E");
		//button to activate normal attack
		global.atk_input_basic = vk_space;
		
	}
	
}



//checks enter input every step when obj_ctrl_menus is on a menu that waits for the player to hit enter
check_enter = function(o) {
	
	with (obj_ctrl_menus) {

		if (text[o, 3]) {
		
			if (keyboard_check_pressed(vk_enter)) {
		
				scr_save_string(global.save_file, global.save_vars[0], keyboard_string);
				scr_load(global.save_file);
		
			}
		
		}
	}
	
}


