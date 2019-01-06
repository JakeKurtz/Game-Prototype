if(state_new) {
	image_index = 0;
	image_speed = 0;
	
	// Getting direction with respect to the player
	var _point_to_player = vector((obj_player.x - x),(obj_player.y - y));
	velocity = vector_scaler(_point_to_player, -3);
}

if (state_timer > 5) { 
	image_speed = default_image_speed; 
	var how_much_blood=irandom(1)+2 
	for (var i=0;i<how_much_blood;i++) { 
	    instance_create_layer(x+(irandom_range(-30, 30)),y+(irandom_range(-30, 30)), "Compatibility_Instances_Depth_0", obj_blood);
	}
	state_switch_previous();
}
