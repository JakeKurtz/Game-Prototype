/// @description Insert description here
// You can write your code in this editor

event_inherited();

obj_e_hitbox = obj_enemyRanged_hitbox;
aggressive = false;
take_damage = true;
flash = 0;
_health = 50;
can_attack = true;

r_attack_range = 100;
m_attack_range = 5;
flee_range = 50;

my_path_position = 0;

speed_flee = 2.5;
speed_follow = 1;
speed_patrol = 1;
speed_pursue = 2.5;
speed_wander = 1;

#region // Steering constants

MASS = 5;
MAX_FORCE = 1;
MAX_AVOID_FORCE = 0.5;

#endregion

#region // Animation arrays and hitbox ranges
idle_animations = array(spr_imp_idle1);

walk_animations = array(spr_imp_walk);
                 
attack_animations = array(spr_imp_attack_r);

ds_map_add(hitbox_range, spr_imp_attack_r, vector(3,4));

#endregion

//Set the default state
state_init("Wander");