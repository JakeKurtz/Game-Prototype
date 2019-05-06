/// @description Debugging crap
// You can write your code in this editor

if (mouse_check_button(mb_left)) {
part_emitter_region(obj_ps.part_system, obj_ps.part_emitter, mouse_x-2, mouse_x+2, mouse_y-2, mouse_y+2, ps_shape_rectangle, ps_distr_linear);
//part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_smoke, 2);
//part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_fire, 2);
//part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_blood2, 2);
}
//part_emitter_region(obj_ps.part_system, obj_ps.part_emitter, mouse_x-10, mouse_x+10, mouse_y-32, mouse_y+32, ps_shape_rectangle, ps_distr_linear);
//part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_blood2, 25);