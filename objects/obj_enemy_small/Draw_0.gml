/// @description Insert description here
// You can write your code in this editor

shadow_size = 0.8;
shadow_height = 45*shadow_size; 
shadow_width = 40*shadow_size;

draw_set_colour(c_black);
draw_set_alpha(0.25);
draw_ellipse(x-shadow_width*.5, y+shadow_height*.15+15, x+shadow_width*.5, y-shadow_height*.25+15, false);

draw_self();

if (flash > 0) {
	flash -= 0.05;
	
	gpu_set_blendmode(bm_add);
	shader_set(shd_flash);
	shd_alpha = shader_get_uniform(shd_flash, "_alpha");
	shader_set_uniform_f(shd_alpha, flash);

	draw_self();

	shader_reset();
	gpu_set_blendmode(bm_normal);
}