
global.save_file = 0;


var name = scr_load_string(0, global.save_vars[0], "New Game");
var newgame = name == "New Game";

if (newgame) {
	
	gui_init_typename();
	exit;
	
}

scr_load(0);
