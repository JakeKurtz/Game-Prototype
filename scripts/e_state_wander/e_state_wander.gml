if(state_new) {
    SPEED = speed_wander;
	image_index = 0;
}

// Sets the objects sprite depending on what direction it's facing.

sprite_index = walk_animations[0];

// If the enemey spots the player, change to pursue state.
if (!(collision_line(x,y,obj_player.x,obj_player.y,obj_solid_nonentity,1,0)) && distance_to_object(obj_player) <= SIGHT_RADIUS) {
	state_switch("Pursue");	
}

else if (instance_exists(obj_enemy_leader)) {
	if (!(collision_line(x,y,obj_enemy_leader.x,obj_enemy_leader.y,obj_solid_nonentity,1,0)) && distance_to_object(obj_enemy_leader) <= SIGHT_RADIUS) {
		state_switch("Follow");	
	}
}

else if (state_timer >= irandom_range(room_speed*2,room_speed*240)) state_switch("Idle");

steering = vector_add(steering, sb_wander(CIRCLE_DISTANCE,CIRCLE_RADIUS,ANGLE_CHANGE,1));