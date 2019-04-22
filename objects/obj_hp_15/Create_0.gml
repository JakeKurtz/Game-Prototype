/// @description Insert description here
// You can write your code in this editor

flash = 1;
flash_rate = 0.05;
can_collide = false;


if (1 == irandom_range(0,1)) {
	x_velocity = -1;	
} else x_velocity = 1;

if (1 == irandom_range(0,1)) {
	y_velocity = -1;	
} else y_velocity = 1;

velocity = vector(x_velocity*irandom_range(2,3),y_velocity*irandom_range(2,3));
decel = 0.05;
alpha = 1;
size = 2;

alarm[0] = 30;