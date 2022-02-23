/// @description check if dead; if atk hitbox hits this object, it takes the atk damage

var lvl = scr_lvl_check(x, y);

if (!lvl == global.level) {
	
	exit;

}


switch(mve_state) {
	
	case 0:
	case 1:
		movement_normal();
		break;
		
	case 2:
		movement_recoil();
		break;

}
