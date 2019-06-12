/// @description Insert description here
// You can write your code in this editor
image_xscale = 1.5;
image_yscale = 1.5;
image_speed = 1;

_light = instance_create_layer(x,y,"Compatibility_Instances_Depth_0", obj_light);

with (_light) {
	light_set_color(make_color_rgb(255,243,178));	
}