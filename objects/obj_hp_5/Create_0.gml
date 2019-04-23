/// @description Insert description here
// You can write your code in this editor

flash = 1;
flash_rate = 0.05;
can_collide = false;

z = 0;
z_velocity = irandom_range(-15,-5);
grav = 0.5;

decel = 0.01;
alpha = 1;
size = 2;

alarm[0] = 30;

if (1 == irandom_range(0,1)) x_velocity = -1;	
else x_velocity = 1;

if (1 == irandom_range(0,1)) y_velocity = -1;	
else y_velocity = 1;

velocity = vector(x_velocity*random_range(0,3),y_velocity*random_range(0,3));