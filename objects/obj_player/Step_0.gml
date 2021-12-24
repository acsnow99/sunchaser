/// @description movement/detect player input

//check if an animation is active to possibly terminate it
chk_animat();
//check if the player is in a movement that prohibits use of all inputs
if (!enabled) exit;


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
	
	
	
	
}


