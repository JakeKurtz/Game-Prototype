
position = vector(x,y);

//steering = vector_add(steering, seek_arrive(obj_Player.x,obj_Player.y,256,0.4));
//steering = vector_add(steering, wander(2048,128,15,1));
//steering = vector_add(steering, flee(mouse_x,mouse_y,1));
//steering = vector_add(steering, pursuit(obj_Player,1));
//steering = vector_add(steering, evade(obj_master_drone,1));

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
	
}

//steering = vector_add(steering, alignment(object_index,32,0.5));
steering = vector_add(steering, separation(object_index,25,2.5));
//steering = vector_add(steering, cohesion(object_index,184,1));
//steering = vector_add(steering, avoid_collision(obj_ObstacleParent,16,2,1));
//steering = vector_add(steering, avoid_collision(obj_EnemyParent,16,1,1));

steering = vector_truncate(steering, MAX_FORCE);
steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);

//image_angle = vector_direction(velocity);

#region // horizontal collision
if (place_meeting(x+velocity[1],y,obj_ObstacleParent)) {
    while(!place_meeting(x+sign(velocity[1]),y,obj_ObstacleParent)) x += sign(velocity[1]);
    velocity[1] = 0;
} #endregion
x += velocity[1];
 
#region // vertical collision
if (place_meeting(x,y+velocity[2],obj_ObstacleParent)) {
    while(!place_meeting(x,y+sign(velocity[2]),obj_ObstacleParent)) y += sign(velocity[2]);
    velocity[2] = 0;
} #endregion
y += velocity[2];