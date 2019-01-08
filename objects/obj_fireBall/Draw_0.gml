/// @description Insert description here
// You can write your code in this editor
gpu_set_blendmode(bm_add);

part_emitter_region(obj_ps.part_system, obj_ps.part_emitter, x-2, x+2, y-2, y+2, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_smoke, 3);
part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_fire, 2);

gpu_set_blendmode(bm_normal);

draw_self();