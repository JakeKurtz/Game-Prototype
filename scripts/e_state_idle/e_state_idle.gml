if(state_new) {
	image_index = 0;
	sprite_index = idle_animations[0];
}

velocity[1] = 0;
velocity[2] = 0;

// If the previous state was attack
if (aggressive == true) {
	
	// Makes sure the enemy is facing the player.
	var vector_dir = point_direction(x,y,obj_player.x,obj_player.y)
	var _distance_to_player = distance_to_point(obj_player.x,obj_player.y);
	
	if ((vector_dir >= 0 && vector_dir <= 70) || (vector_dir >= 290 && vector_dir <= 360)) image_xscale = image_scale;
	else if (vector_dir >= 110 && vector_dir <= 250) image_xscale = -image_scale;
	
	// Attack again after some time
	if (can_attack) {
		// If the player gets to far away, then pursue him.
		if (r_attack_range != -1 && _distance_to_player <= r_attack_range && _distance_to_player > flee_range) {
			state_switch("Ranged Attack");
		} else if (m_attack_range != -1 && _distance_to_player <= m_attack_range) { 
			state_switch("Melee Attack");
		}	
	}
	
	else if (r_attack_range != -1 && _distance_to_player > r_attack_range) state_switch("Pursue");
	else if (m_attack_range != -1 && _distance_to_player > m_attack_range) state_switch("Pursue");
	
	if (flee_range != -1 && _distance_to_player <= flee_range && _distance_to_player > m_attack_range) state_switch("Flee");
	
}
// If the previous state was patrol
else {
	if (state_timer >= irandom_range(120,500)) state_switch_previous();
	// If the enemey spots the player, change to pursue state.
	if (!(collision_line(x,y,obj_player.x,obj_player.y,obj_solid_nonentity,1,0)) && distance_to_object(obj_player) <= SIGHT_RADIUS) {
		state_switch("Pursue");	
	}
}