/// @description Scaling to player proportions

// Inherit the parent event
event_inherited();

damage = 25;

image_scale = obj_player.image_scale;

image_xscale = image_xscale*image_scale;
image_yscale = image_yscale*image_scale;

alarm[0] = 3;