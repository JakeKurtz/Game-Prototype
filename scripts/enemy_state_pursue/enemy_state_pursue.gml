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
	steering = vector_add(steering, sb_path_pursue(path,32,1,1));
}

if (path_get_length(path) <= 64) state_switch("Attack");
//if (place_meeting(x,y,obj_Player) && obj_Player.state_name == "Dash") state_switch("Airborn");

//else { 
//	state_switch("Patrol"); 
//}

steering = vector_add(steering, sb_avoid_collision(obj_obstacle,64,MAX_AVOID_FORCE,3));
steering = vector_add(steering, sb_separation(object_index,32,2));
steering = vector_add(steering, sb_separation(obj_player,32,2));
steering = vector_truncate(steering, MAX_FORCE);
steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);