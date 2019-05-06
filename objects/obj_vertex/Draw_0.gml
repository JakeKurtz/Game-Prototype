/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (obj_graph.last_used_red == id) {
	flash -= flash_rate;
	gpu_set_blendmode(bm_add);
	shader_set(shd_flash);
	shd_alpha = shader_get_uniform(shd_flash, "_alpha");
	shader_set_uniform_f(shd_alpha, flash);
	draw_self();
	shader_reset();
	gpu_set_blendmode(bm_normal);
	
	if (flash <= 0 || flash >= 1) flash_rate *= -1;
}

if (obj_graph.last_used_blue == id) {
	flash -= flash_rate;
	gpu_set_blendmode(bm_add);
	shader_set(shd_flash);
	shd_alpha = shader_get_uniform(shd_flash, "_alpha");
	shader_set_uniform_f(shd_alpha, flash);
	draw_self();
	shader_reset();
	gpu_set_blendmode(bm_normal);
	
	if (flash <= 0 || flash >= 1) flash_rate *= -1;
}