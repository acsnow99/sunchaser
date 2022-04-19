
for (var i = 0; i < global.atk_types_count; i++) {
	
	if (atk_vuln[i]) {
	
		if (place_meeting(x, y, global.atk_types[i])) {
		
			die(i);
		
		}
		
	}
	
}

