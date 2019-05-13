if (state_new) {
    SPEED = 4;
	image_index = 0;
}

sprite_index = walk_animations[0];

if (mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y, 1)) {
	steering = vector_add(steering, sb_path_pursue(path,1,1,1));
}

if (!(collision_line(x,y,obj_player.x,obj_player.y,obj_solid_nonentity,1,0))) {
	if (distance_to_object(obj_player) <= m_attack_range) {
		state_switch("Attack");
	}
}

steering = vector_add(steering, sb_avoid_collision(obj_obstacle,64,MAX_AVOID_FORCE,3));

steering = vector_add(steering, sb_separation(object_index,50,3));
steering = vector_add(steering, sb_alignment(object_index,40,2));
steering = vector_add(steering, sb_queue(object_index, 32, 32));

steering = vector_truncate(steering, MAX_FORCE);
steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), SPEED);