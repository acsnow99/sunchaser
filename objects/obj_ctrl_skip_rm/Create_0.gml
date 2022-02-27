//@description intro text

if (room == rm_setup) {
	txt = "You are the SUNCHASER, a warrior\nwho survives only in sunlight. \nThe sun is setting. \nUse your attacks(SPACE and E)\nto make it to town! \n\nPress SPACE to continue." 
}
else {
	txt = "YOU MADE IT!\nCONGRATULATIONS\n\nTIME: " + string(global.alarmvar_runtime) + "\n\n\nPress R to restart\nPress ESC to end game.";
}
