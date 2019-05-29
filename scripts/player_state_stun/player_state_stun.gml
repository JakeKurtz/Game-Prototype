if(state_new) {
	image_index = 0;
	image_speed = 0;
	//WASD_enabled = false;
	// Getting direction with respect to the enemy
	var _point_to_object = vector((hitBy.owner.x - x),(hitBy.owner.y - y));
	velocity = vector_mulr(vector_scaler(_point_to_object, -1), 8);
	
	x_speed = velocity[1];
	y_speed = velocity[2];
}

if (state_timer > 10) {
	image_speed = default_image_speed;
	state_switch("Idle");
}

