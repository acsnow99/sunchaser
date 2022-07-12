
if (global.pause || global.menu_ingame) {
	
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


if (global.menu_ingame) {
	
	if (menu != 3)	{
	
		gui_init_pause_menu();
		
	}
	
}
