/// @description Insert description here
// You can write your code in this editor
//image_blend = make_colour_rgb(0, 0, 255);
//draw_set_colour(c_black);
//draw_set_alpha(0.25);
//draw_ellipse(x-shadow_width*.5, y+shadow_height*.15+24, x+shadow_width*.5, y-shadow_height*.25+24, false);

//draw_text(20,20,string_hash_to_newline("State: "+string(state_name)+"#X velocity: "+string(velocity[1])+"#Y velocity: "+string(velocity[2])));

//draw_sprite_ext(spr_arrow,0,x,y,2,1,vector_direction(velocity),c_red,1);

shadow_size = 1.8;
shadow_height = 45*shadow_size; 
shadow_width = 40*shadow_size;

draw_set_colour(c_black);
draw_set_alpha(0.25);
draw_ellipse(x-shadow_width*.5, y+shadow_height*.15+20, x+shadow_width*.5, y-shadow_height*.25+20, false);

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