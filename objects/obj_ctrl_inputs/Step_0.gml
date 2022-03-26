
var _r = room == rm_level

if (_r) {
	///pause game when escape is hit
	if (keyboard_check_pressed(vk_escape)) {
	
		global.pause = !global.pause;

	}
}

if (keyboard_check_pressed(ord("R"))) {
	
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

