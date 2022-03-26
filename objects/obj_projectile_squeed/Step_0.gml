
var lvl = scr_lvl_check(x, y);

if (lvl != global.level) {
	
	die();

}

switch(mve_state) {
	
	case 0:
		movement_charge();
		break;
	case 1:
		movement_shoot();
		break;
	
}

