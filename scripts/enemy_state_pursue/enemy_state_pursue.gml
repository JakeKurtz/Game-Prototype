if(state_new) {
    MAX_SPEED = 4;
	image_index = 0;
	image_speed = 1;
}

for (var i = 0; i < 4; i++){
    if (facing == i) sprite_index = walk_animations[i];
}

//steering = vector_add(steering, seek_arrive(obj_Player.x,obj_Player.y,256,0.4));

if (mp_grid_path(global.grid, path, x, y, obj_player.x, obj_player.y, 1)) {
	steering = vector_add(steering, sb_path_pursue(path,32,1,1.5));
}

if (path_get_length(path) <= 64) state_switch("Attack");

steering = vector_add(steering, sb_avoid_collision(obj_obstacle,64,MAX_AVOID_FORCE,1));
//steering = vector_add(steering, sb_avoid_collision(obj_enemy_parent,64,MAX_AVOID_FORCE,2));
steering = vector_add(steering, sb_queue(object_index, 32, 32));
steering = vector_truncate(steering, MAX_FORCE);
steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);