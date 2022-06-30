
global.save_file = 2;


var name = scr_load_string(2, global.save_vars[0], "New Game");
var newgame = name == "New Game";

if (newgame) {
	
	gui_init_typename();
	exit;
	
}

scr_load(2);
