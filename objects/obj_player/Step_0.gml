/// @description movement/detect player input




//movement of all types, organized by a simple integer(0, 1, 2, 3, 4) (idle, running, attacking, special attack, receiving damage)
switch (mve_state) {

	case 0:
	case 1:
		if (global.gp_active) {
		
			movement_input_gp(0, 0, 0);
			
		}
		else {
			
			movement_input_keyboard(0, 0, 0);
			
		}
		break;
		
	case 2:
		movement_input_atk_basic();
		break;
		
	case 3:
		movement_input_atk_sp();
		break;
	
	case 4:
	
		break;
		
	case 5:
		movement_input_recoil_receiving();
		break;

	
	
}




