if(state_new) {
    MAX_SPEED = 1.5;
	image_index = 0;
	image_speed = 1;
}

var current_node = path_position;

// Sets the objects sprite depending on what direction it's facing.
for (var i = 0; i < 4; i++){
    if (facing == i) sprite_index = walk_animations[i];
}

// Seeks the path that it needs to follow.
if (mp_grid_path(global.grid, path, x, y, path_get_point_x(path_patrol, 0), path_get_point_y(path_patrol, 0), 1) && can_seek) {
		steering = vector_add(steering, path_pursue(path,32,1,1));
}

// Once it's reached the start of the path, it starts its patrol.
if (path_get_length(path)<= 32) can_seek = false;

if (can_seek = false) {
	steering = vector_add(steering, path_tofro(path_patrol,15,my_path_dir,1));
	// Will change state to idle at each node in the path.
	if (current_node != path_position) {
		current_node = path_position;
		state_switch("Idle");
	}
}

// If the enemey spots the player, change to pursue state.
if (!(collision_line(x,y,obj_Player.x,obj_Player.y,obj_WallParent,1,0)) && distance_to_object(obj_Player) <= SIGHT_RADIUS) {
	state_switch("Pursue");	
}

if (place_meeting(x,y,obj_Player) && obj_Player.state_name == "Dash") state_switch("Airborn");

steering = vector_add(steering, separation(object_index,32,3));
steering = vector_add(steering, avoid_collision(obj_ObstacleParent,64,MAX_AVOID_FORCE,3));
steering = vector_truncate(steering, MAX_FORCE);
steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);