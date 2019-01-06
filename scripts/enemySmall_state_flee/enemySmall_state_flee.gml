if (state_new) {
    MAX_SPEED = 2;
	image_index = 0;
}

sprite_index = walk_animations[0];

// If enemy gets close enough to the player, then it starts its ranged attack.
// Otherwise, if the player gets any closer, it trys to run away.
if (!(collision_line(x,y,obj_player.x,obj_player.y,obj_solid_nonentity,1,0))) {
	if (distance_to_object(obj_player) <= r_attack_range && distance_to_object(obj_player) > flee_range) {
		state_switch("Ranged Attack");
	} else if (distance_to_object(obj_player) <= m_attack_range) { 
		state_switch("Melee Attack");
	} else state_switch("Pursue");
}
steering = vector_add(steering, sb_evade(obj_player, 1));

steering = vector_add(steering, sb_avoid_collision(obj_obstacle,150,MAX_AVOID_FORCE,3));
steering = vector_add(steering, sb_avoid_collision(obj_enemy_parent,150,MAX_AVOID_FORCE,3));
steering = vector_add(steering, sb_separation(object_index,30,5));
steering = vector_add(steering, sb_queue(object_index, 30, 60));
steering = vector_truncate(steering, MAX_FORCE);
steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);