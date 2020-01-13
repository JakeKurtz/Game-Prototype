/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

image_index = 9;
image_speed = 0;

z = -1;
image_alpha = sprite_height / 255; //piggyback alpha channel to encode sprite height

alarm[1] = 120;

z_velocity = irandom_range(-5,-2);

//hitbox
timer = 120;
flag = true;
killme = false;
hitbox = -1;
damage = 100;