
function wait(fun, time){

	time -= global.dt_steady;
	
	if (time <= 0) {
		
		fun();
		return 500000;
		
	}
	else {
		
		return time;
		
	}

}