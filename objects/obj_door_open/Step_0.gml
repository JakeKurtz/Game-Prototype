/// @description Insert description here
// You can write your code in this editor

depth = -y;

if (image_index+image_speed <= 0) {
	instance_create_layer(x, y, "Compatibility_Instances_Depth_0", obj_door_close);
	instance_destroy();
}