/// @description Insert description here
// You can write your code in this editor

depth = -y;

if (image_index+image_speed >= image_number) {
	instance_create_layer(x, y, "Instances", obj_door_open);
	mp_grid_clear_rectangle(global.grid, bbox_left, bbox_top, bbox_right, bbox_bottom);
	instance_destroy();
}