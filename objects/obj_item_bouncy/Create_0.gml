/// @description Insert description here
// You can write your code in this editor

can_collide = false;
shadow = true;

init_velocity = random_range(1,2);

z = 0;
//z_velocity = irandom_range(-3,-2);
z_velocity = -init_velocity;
grav = 0.25;

decel = 0.01;
alpha = 1;
size = 2;

alarm[0] = 30;

if (1 == irandom_range(0,1)) x_velocity = -1;	
else x_velocity = 1;

if (1 == irandom_range(0,1)) y_velocity = -1;	
else y_velocity = 1;

//velocity = vector(x_velocity*random_range(0,2),y_velocity*random_range(0,2));
velocity = vector(x_velocity*init_velocity,y_velocity*init_velocity);