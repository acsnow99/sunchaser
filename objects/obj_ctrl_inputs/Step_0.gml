
///End game when escape is hit
if (keyboard_check(vk_escape)) {
	
	game_end();

}

if (keyboard_check(ord("R"))) {
	
	game_restart();

}

if (keyboard_check_released(ord("P"))) {
	
	if (global.debug) {
		global.debug = false;
	}
	else {
		global.debug = true;	
	}

}

