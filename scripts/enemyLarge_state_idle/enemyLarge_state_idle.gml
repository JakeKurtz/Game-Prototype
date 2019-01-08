if(state_new) {
    velocity[1] = 0;
	velocity[2] = 0;
	image_index = 0;
	sprite_index = idle_animations[0];
}

var top_val = ds_stack_pop(state_stack); 
var previous_state = ds_stack_top(state_stack); // reading state previous 
ds_stack_push(state_stack, top_val); // restoring stack

// If the previous state was attack
if (aggressive == true) {
	// Attack again after some time
	if (can_attack) state_switch("Attack");
	
	// Makes sure the enemy is facing the player.
	var vector_dir = point_direction(x,y,obj_player.x,obj_player.y)
	if ((vector_dir >= 0 && vector_dir <= 70) || (vector_dir >= 290 && vector_dir <= 360)) image_xscale = image_scale;
	else if (vector_dir >= 110 && vector_dir <= 250) image_xscale = -image_scale;
	
	// If the player gets to far away, then pursue him.
	if (distance_to_object(obj_player) > m_attack_range) state_switch("Pursue");
}
// If the previous state was patrol
else {
	
	if (state_timer >= irandom_range(120,500)) state_switch_previous();
	
	// If the enemey spots the player, change to pursue state.
	if (!(collision_line(x,y,obj_player.x,obj_player.y,obj_solid_nonentity,1,0)) && distance_to_object(obj_player) <= SIGHT_RADIUS) {
		velocity[1] = 0;
		velocity[2] = 0;
		sprite_index = spr_minotaur_taunt;
		if (image_index+image_speed >= image_number) state_switch("Pursue");	
	}
}