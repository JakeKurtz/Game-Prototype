
position = vector(x,y);

//steering = vector_add(steering, seek_arrive(mouse_x,mouse_y,256,1));
//steering = vector_add(steering, wander(2048,128,15,1));
//steering = vector_add(steering, flee(mouse_x,mouse_y,1));
//steering = vector_add(steering, pursuit(obj_master_drone,1));
//steering = vector_add(steering, evade(obj_master_drone,1));
steering = vector_add(steering, path_loop(path,15,1,0.1));

//steering = vector_add(steering, alignment(object_index,128,1));
steering = vector_add(steering, separation(object_index,32,0.1));
//steering = vector_add(steering, cohesion(object_index,184,2));
steering = vector_add(steering, avoid_collision(obj_ObstacleParent,10,5,0.5));

steering = vector_truncate(steering, MAX_FORCE);
//steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);

image_angle = vector_direction(velocity);
	
x += velocity[1];
y += velocity[2];