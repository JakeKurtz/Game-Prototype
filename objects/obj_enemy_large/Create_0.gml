/// @description Properties

event_inherited();
take_damage = true;
aggressive = false;
flash = 0;
_health = 150;
can_attack = true;

m_attack_range = 5;
flee_range = 64;

my_path_dir = 1;
my_path_position = 0;
facing = 0;
can_seek = true;

#region // Steering constants
MASS = 5;

MAX_SPEED = 3;
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
#endregion

#region //Define States
state_create("Patrol",enemyLarge_state_patrol);
state_create("Idle",enemyLarge_state_idle);
state_create("Pursue",enemyLarge_state_pursue);
state_create("Attack",enemyLarge_state_attackMelee);
state_create("Stun",enemyLarge_state_stun);
state_create("Die",enemySmall_state_die);
#endregion

//Set the default state
state_init("Patrol");