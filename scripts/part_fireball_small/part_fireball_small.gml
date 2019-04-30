size = 5;

part_emitter_region(obj_ps.part_system, obj_ps.part_emitter, x-size, x+size, y-size, y+size, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_smoke, 2);
part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_fire, 2);