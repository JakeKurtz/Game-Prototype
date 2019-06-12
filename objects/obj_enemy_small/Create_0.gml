/// @description Properties
event_inherited();

hurtbox = hurtbox_create(14,18,-7,-9);
damage = 20;

take_damage = true;
aggressive = false;
take_damage = true;
draw_blood = false;
can_attack = true;
_health = irandom_range(50,100);
strength = _health;

m_attack_range = 0;
my_path_position = 0;

speed_flee = 0.5;
speed_follow = 0.5;
speed_patrol = 0.5;
speed_pursue = 0.5;
speed_wander = 0.5;

#region // Steering constants
MASS = 32;
ANGLE_CHANGE = 0.25;
CIRCLE_DISTANCE = 128;
CIRCLE_RADIUS = 25;

SPEED = 0.5;
MAX_FORCE = 1;
MAX_AVOID_FORCE = 0.25;
#endregion

#region // Animation arrays

die_animation = spr_zombie_die;

idle_animations = array(spr_zombie_idle2,
						spr_zombie_f_idle);

walk_animations = array(spr_zombie_walk);
                 
attack_animations = array(spr_zombie_attack1,
	                      spr_zombie_attack2);
						  
ds_map_add(hitbox_range, spr_zombie_attack1, 4);
ds_map_add(hitbox_range, spr_zombie_attack2, 4);

#endregion

//Set the default state
state_init("Wander");