if(state_new) {
    MAX_SPEED = 1.5;
	can_seek = true;
}

for (var i = 0; i < 4; i++){
    if (facing == i) sprite_index = walk_animations[i];
}

if (mp_grid_path(global.grid, path, x, y, path_get_point_x(path1, 0), path_get_point_y(path1, 0), 1) && can_seek) {
		steering = vector_add(steering, path_pursue(path,32,1,1));
}

if (path_get_length(path)<= 32) {
	can_seek = false;
}

if (can_seek = false) {
	steering = vector_add(steering, path_tofro(path1,15,my_path_dir,1));	
}

steering = vector_add(steering, separation(object_index,32,3));
steering = vector_add(steering, avoid_collision(obj_ObstacleParent,64,1,3));
steering = vector_truncate(steering, MAX_FORCE);
steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);