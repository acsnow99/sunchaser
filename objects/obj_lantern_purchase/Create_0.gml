
price = 60;

item_index = 2;


spr_current = spr_icon_sun_lantern;



attempt_purchase = function() {
	
	if (global.currency >= price) {
		
		global.items[item_index] = true;
		
		global.currency -= price;
		
		instance_destroy(self);
		
	}
	
}

