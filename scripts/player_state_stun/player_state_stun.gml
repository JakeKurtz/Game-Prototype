if(state_new) {
	image_index = 0;
	image_speed = 0;
	//WASD_enabled = false;
	// Getting direction with respect to the player
	var _nearest_hitbox = instance_nearest(x,y,obj_enemy_hitbox);
	
	if instance_exists(_nearest_hitbox){
		var _point_to_player = vector(((_nearest_hitbox.x-_nearest_hitbox.velocity[1])-x),((_nearest_hitbox.y-_nearest_hitbox.velocity[2])-y));
		velocity = vector_mulr(vector_scaler(_point_to_player, -1), 8);
	}
	
	x_speed = velocity[1];
	y_speed = velocity[2];
}

if (state_timer > 10) {
	image_speed = default_image_speed;
	state_switch("Idle");
}

