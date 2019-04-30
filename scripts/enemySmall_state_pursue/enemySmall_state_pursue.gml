if (state_new) {
	aggressive = true;
    MAX_SPEED = 0.7;
	image_index = 0;
}

sprite_index = walk_animations[0];

if (mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y, 1)) {
	steering = vector_add(steering, sb_path_pursue(path,1,1,1));
}

// If enemy gets close enough to player, then get ready to attack.
if (!(collision_line(x,y,obj_player.x,obj_player.y,obj_solid_nonentity,1,0))) {
	if (distance_to_object(obj_player) <= m_attack_range) {
		state_switch("Attack");
	}
}

steering = vector_add(steering, sb_avoid_collision(obj_obstacle,150,MAX_AVOID_FORCE,3));
steering = vector_add(steering, sb_avoid_collision(obj_enemy_parent,150,MAX_AVOID_FORCE,3));

steering = vector_add(steering, sb_separation(object_index,30,5));
steering = vector_add(steering, sb_alignment(object_index,30,2));
steering = vector_add(steering, sb_cohesion(object_index,30,1));
steering = vector_add(steering, sb_queue(object_index, 30, 60));
steering = vector_truncate(steering, MAX_FORCE);
steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);