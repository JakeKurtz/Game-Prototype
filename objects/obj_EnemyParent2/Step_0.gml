/// @description Insert description here
// You can write your code in this editor

position = vector(x,y);

//steering = wander(200, 30, 2*pi, 1);
steering = seek_arrive(obj_Player.x, obj_Player.y, 32, 0.05);
steering = vector_add(steering, avoid_collision(obj_ObstacleParent, 64, 15, 1));
steering = vector_add(steering, separation(obj_EnemyParent2, 16, 1));
//steering = vector_add(steering, cohesion(obj_EnemyParent2, 16, 1));
//steering = vector_add(steering, alignment(obj_EnemyParent2, 16, 1));
steering = vector_truncate(steering, MAX_FORCE);
velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);
	
x += velocity[1];
y += velocity[2];