/// @description movement/detect player input

//DELETE ONCE ANIMATIONS ARE SPRITE-BASED ONLY
//check if an animation is active to possibly terminate it
chk_animat();




//movement of all types, organized by a simple integer(0, 1, 2, 3, 4) (idle, running, attacking, special attack, receiving damage)
switch (mve_state) {

	case 0:
	case 1:
		movement_input_normal(0, 0, 0);
		break;
		
	case 2:
		
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




