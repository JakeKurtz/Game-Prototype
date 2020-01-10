/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
//event_inherited();

size = 24;

tex = sprite831;
vertexBuffer = obj_loader("wall_2.obj");
modelMatrix = matrix_build(x, y, 0, 0, 0, image_angle, size*image_xscale, size*image_yscale, size);

