///@function part_blood_large
///@arg object_attacking

var _object_attacking = argument[0];

var _point_to_player = vector((_object_attacking.x - x),(_object_attacking.y - y));
	
// Blood flys towards player
part_type_direction(obj_ps.part_blood2,vector_direction(_point_to_player),vector_direction(_point_to_player)+45,0,0);
part_type_speed(obj_ps.part_blood2,(vector_len(_object_attacking.velocity)/3)-1,(vector_len(_object_attacking.velocity)/3)+1,0,0);
	
part_type_direction(obj_ps.part_blood,vector_direction(_point_to_player),vector_direction(_point_to_player)+45,0,0);
part_type_speed(obj_ps.part_blood,(vector_len(_object_attacking.velocity)/3)-2,(vector_len(_object_attacking.velocity)/3)+2,0,0);
	
part_emitter_region(obj_ps.part_system, obj_ps.part_emitter, x-6, x+6, y-3, y+3, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_blood2, 2);
part_emitter_burst(obj_ps.part_system, obj_ps.part_emitter, obj_ps.part_blood, 5);
	
var how_much_blood=irandom(2) 
for (var i=0;i<how_much_blood;i++) { 
	instance_create_layer(x+(irandom_range(-30, 30)),y+(irandom_range(-30, 30)), "surface_floor", obj_blood);
}