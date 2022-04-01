
var _r = room == rm_level

if (_r) {
	///pause game when escape is hit
	if (keyboard_check_pressed(vk_escape)) {
	
		global.pause = !global.pause;

	}
}

/*
if (keyboard_check_pressed(ord("R"))) {
	
	game_load("savegame");

}

if (keyboard_check_pressed(ord("T"))) {
	
	game_save("savegame");

}
*/

if (keyboard_check_pressed(ord("X"))) {
	
	game_end();

}

/*
if (keyboard_check_released(ord("P"))) {
	
	if (global.debug) {
		global.debug = false;
	}
	else {
		global.debug = true;	
	}

}
*/


if (keyboard_check_pressed(ord("C"))) {
	
	for (var i = global.item_equipped + 1; i < 500; i++) {
	
		if (i >= global.items_count) {
			
			i = 0;
			
		}
	
		if (global.items[i]) {
		
			global.item_equipped = i;
			i = 500;
		
		}
		
	}
	
}

