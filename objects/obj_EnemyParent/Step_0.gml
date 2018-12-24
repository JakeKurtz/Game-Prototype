
position = vector(x,y);

//steering = vector_add(steering, seek_arrive(obj_Player.x,obj_Player.y,256,0.4));
//steering = vector_add(steering, wander(2048,128,15,1));
//steering = vector_add(steering, flee(mouse_x,mouse_y,1));
//steering = vector_add(steering, pursuit(obj_Player,1));
//steering = vector_add(steering, evade(obj_master_drone,1));
/*
if (mp_grid_path(global.grid, path, x, y, obj_Player.x, obj_Player.y, 1)) {
	MAX_SPEED = 4;
	steering = vector_add(steering, path_loop(path,15,1,1));
	steering = vector_add(steering, avoid_collision(obj_ObstacleParent,16,2,1));
	steering = vector_add(steering, avoid_collision(obj_EnemyParent,16,2,1));
}
else {
	MAX_SPEED = 1;
	steering = vector_add(steering, wander(2048,512,45,1));
	//steering = vector_add(steering, cohesion(object_index,184,1));
	//steering = vector_add(steering, alignment(object_index,32,0.5));
	steering = vector_add(steering, avoid_collision(obj_ObstacleParent,16,1,2));
	
}*/

//steering = vector_add(steering, alignment(object_index,32,0.5));
//steering = vector_add(steering, separation(object_index,25,2.5));
//steering = vector_add(steering, cohesion(object_index,184,1));
//steering = vector_add(steering, avoid_collision(obj_ObstacleParent,16,2,1));
//steering = vector_add(steering, avoid_collision(obj_EnemyParent,16,1,1));

depth = -y;

image_blend = make_colour_rgb(255, 0, 0);

var vector_dir = ceil(vector_direction(velocity));

if (vector_dir >= 0 && vector_dir <= 15) facing = 2;
else if (vector_dir >= 45 && vector_dir < 90) facing = 0;
else if (vector_dir >= 90 && vector_dir < 135) facing = 0;
else if (vector_dir >= 165 && vector_dir <= 195) facing = 1;
else if (vector_dir >= 225 && vector_dir < 270) facing = 3;
else if (vector_dir >= 270 && vector_dir < 315) facing = 3;
else if (vector_dir >= 345) facing = 2;

#region // horizontal collision
if (place_meeting(x+velocity[1],y,obj_WallParent)) {
    while(!place_meeting(x+sign(velocity[1]),y,obj_WallParent)) x += sign(velocity[1]);
    velocity[1] = 0;
} #endregion
x += velocity[1];

#region // vertical collision
if (place_meeting(x,y+velocity[2],obj_WallParent)) {
    while(!place_meeting(x,y+sign(velocity[2]),obj_WallParent)) y += sign(velocity[2]);
    velocity[2] = 0;
} #endregion
y += velocity[2];

state_execute();