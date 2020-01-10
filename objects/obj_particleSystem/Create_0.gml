/// @description Particle setup

/// partical init
part_system = part_system_create();
part_emitter = part_emitter_create(part_system);

part_system_depth(part_system,-room_height);

// Dust 
part_player_dust = part_type_create();
part_type_colour2(part_player_dust, c_ltgray, c_ltgray);
part_type_size(part_player_dust, 5, 8, -0.2, 0);
part_type_shape(part_player_dust, pt_shape_pixel);
part_type_gravity(part_player_dust, 0.005, 90);
part_type_life(part_player_dust, 30, 60);

// Blood
part_blood = part_type_create();
part_type_colour1(part_blood, global.c_blood_red);
part_type_size(part_blood, 1, 2, 0, 0);
part_type_shape(part_blood,pt_shape_pixel);
part_type_life(part_blood, 15, 15);

part_blood2 = part_type_create();
part_type_size(part_blood2, 1, 2, -0.01, 0);
part_type_sprite(part_blood2,spr_bloodExplosion2,0,0,1);
part_type_life(part_blood2, 15, 25);
part_type_gravity(part_blood2, 0.05, 270);

// Fire
part_fire = part_type_create();
part_type_orientation(part_fire,0,359,0,0,0);
part_type_colour3(part_fire, c_yellow, c_red, c_ltgray);
part_type_size(part_fire, 1, 1, -0.01, 0);
part_type_sprite(part_fire, spr_fire,1,1,0);
part_type_life(part_fire, 15, 30);
part_type_gravity(part_fire, 0.005, 90);
//part_type_blend(part_fire,1);

// Smoke
part_smoke = part_type_create();
part_type_orientation(part_fire,0,359,0,0,0);
part_type_alpha3(part_smoke,0,1,1);
part_type_colour2(part_smoke, c_black, c_ltgray);
part_type_size(part_smoke, 1, 1, 0, 0);
part_type_sprite(part_smoke, spr_smoke,1,1,0);
part_type_life(part_smoke, 30, 60);
part_type_gravity(part_smoke, 0.01, 90);