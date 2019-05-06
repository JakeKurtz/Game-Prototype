/// @description Insert description here
// You can write your code in this editor

can_collide = false;
shadow = true;

z = 0;
z_velocity = irandom_range(-5,-2);
grav = 0.25;

decel = 0.008;
alpha = 1;
size = 2;

alarm[0] = 30;

if (1 == irandom_range(0,1)) x_velocity = -1;	
else x_velocity = 1;

if (1 == irandom_range(0,1)) y_velocity = -1;	
else y_velocity = 1;

velocity = vector(x_velocity*random_range(0,1.5),y_velocity*random_range(0,1.5));