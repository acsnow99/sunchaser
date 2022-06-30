
global.save_file = 1;


var name = scr_load_string(1, global.save_vars[0], "New Game");
var newgame = name == "New Game";

if (newgame) {
	
	gui_init_typename();
	exit;
	
}

scr_load(1);
