if(state_new) {
	image_index = 0;
	image_speed = 0;
	
	// Getting direction with respect to the player
	var _point_to_object = vector((hitBy.owner.x - x),(hitBy.owner.y - y));
	velocity = vector_mulr(vector_scaler(_point_to_object, -1), 8);
}

if (state_timer > 5) { 
	image_speed = default_image_speed; 
	state_switch_previous();
}
