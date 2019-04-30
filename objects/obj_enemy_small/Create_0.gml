/// @description Properties
event_inherited();
take_damage = true;
aggressive = false;
take_damage = true;
draw_blood = false
can_attack = true;
_health = 25;

m_attack_range = 1;
r_attack_range = 32;
flee_range = 200;

my_path_position = 0;

#region // Steering constants
MASS = 5;
ANGLE_CHANGE = 0.5;
CIRCLE_DISTANCE = 100;
CIRCLE_RADIUS = 25;

MAX_SPEED = 2;
MAX_FORCE = 0.5;
MAX_AVOID_FORCE = 5;
#endregion

#region // Animation arrays

idle_animations = array(spr_zombie_idle2,spr_zombie_f_idle);

walk_animations = array(spr_zombie_walk);
                 
attack_animations = array(spr_zombie_attack1,
	                      spr_zombie_attack2);
#endregion

#region //Define States
state_create("Pursue",enemySmall_state_pursue);
state_create("Idle",enemySmall_state_idle);
state_create("Attack",enemySmall_state_attackMelee);
state_create("Flee",enemySmall_state_flee);
state_create("Follow",enemySmall_state_follow);
state_create("Wander",enemySmall_state_wander);
state_create("Stun",enemySmall_state_stun);
state_create("Die",enemySmall_state_die);
#endregion

//Set the default state
state_init("Wander");