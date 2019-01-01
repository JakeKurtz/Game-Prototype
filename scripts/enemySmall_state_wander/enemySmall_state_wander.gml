if(state_new) {
    MAX_SPEED = 0.5;
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

steering = vector_add(steering, sb_avoid_collision(obj_obstacle,150,MAX_AVOID_FORCE,3));
steering = vector_add(steering, sb_avoid_collision(obj_enemy_parent,150,MAX_AVOID_FORCE,3));
steering = vector_add(steering, sb_separation(object_index,30,5));
steering = vector_add(steering, sb_alignment(object_index,30,3));
steering = vector_add(steering, sb_queue(object_index, 30, 60));
steering = vector_truncate(steering, MAX_FORCE);
steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);