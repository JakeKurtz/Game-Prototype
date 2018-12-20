if(state_new) {
    MAX_SPEED = 4;
}

for (var i = 0; i < 4; i++){
    if (facing == i) sprite_index = walk_animations[i];
}

//steering = vector_add(steering, seek_arrive(obj_Player.x,obj_Player.y,256,0.4));

if (mp_grid_path(global.grid, path, x, y, obj_Player.x, obj_Player.y, 1)) {
	steering = vector_add(steering, path_pursue(path,32,1,1));
	steering = vector_add(steering, separation(object_index,32,3));
	steering = vector_add(steering, separation(obj_Player,32,2));
	steering = vector_add(steering, avoid_collision(obj_ObstacleParent,64,1,3));
	steering = vector_truncate(steering, MAX_FORCE);
	steering = vector_divr(steering, MASS);
	velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);
	
	//if (path_get_length(path)<= 32) state_switch("Attack");
}

//else { 
//	state_switch("Patrol"); 
//}