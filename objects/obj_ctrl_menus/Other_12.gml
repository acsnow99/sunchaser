
var name = scr_load_string(0, "filename", "New Game");
var newgame = name == "New Game"

if (newgame) {
	
	gui_init_typename();
	exit;
	
}

scr_load(0);
