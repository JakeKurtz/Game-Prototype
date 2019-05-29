/// @description Properties

event_inherited();

take_damage = true;
aggressive = false;
flash = 0;
_health = 150;
strength = _health;
can_attack = true;

m_attack_range = 5;

my_path_dir = 1;
my_path_position = 0;
facing = 0;
can_seek = true;

#region // Steering constants
MASS = 5;

SPEED = 2;
MAX_FORCE = 1;
ARRIVAL_FORCE = 1;
MAX_AVOID_FORCE = 0.5;
#endregion

#region // Animation arrays

idle_animations = array(spr_minotaur_idle1,
						spr_minotaur_idle2,
						spr_minotaur_idle3);

walk_animations = array(spr_minotaur_walk);
                 
attack_animations = array(spr_minotaur_attack1,
	                      spr_minotaur_attack2,
	                      spr_minotaur_attack3);
						  
ds_map_add(hitbox_range, spr_minotaur_attack1, 2);
ds_map_add(hitbox_range, spr_minotaur_attack2, 2);
ds_map_add(hitbox_range, spr_minotaur_attack3, 6);
						  
#endregion

#region //Define States
state_create("Patrol",e_state_patrol);
state_create("Idle",e_state_idle);
state_create("Pursue",e_state_pursue);
state_create("Attack",e_state_attackMelee);
state_create("Stun",e_state_stun);
state_create("Die",e_state_die);
#endregion

//Set the default state
state_init("Patrol");