/// @description Insert description here
// You can write your code in this editor

event_inherited();

aggressive = false;
take_damage = true;
flash = 0;
_health = 50;
can_attack = true;

r_attack_range = 100;
m_attack_range = 5;
flee_range = 50;

my_path_position = 0;

#region // Steering constants
MASS = 5;

MAX_FORCE = 1;
MAX_AVOID_FORCE = 0.5;
#endregion

#region // Animation arrays
idle_animations = array(spr_imp_idle1);

walk_animations = array(spr_imp_walk);
                 
attack_animations = array(spr_imp_attack_r);
#endregion

#region //Define States
state_create("Patrol",enemy_state_patrol);
state_create("Idle",enemyRanged_state_idle);
state_create("Pursue",enemyRanged_state_pursue);
state_create("Ranged Attack",enemyRanged_state_attackRanged);
state_create("Melee Attack",enemyRanged_state_attackMelee);
state_create("Flee",enemyRanged_state_flee);
state_create("Stun", enemyRanged_state_stun);
state_create("Die", enemyRanged_state_die);
state_create("Follow", enemyRanged_state_follow);
state_create("Wander", enemyRanged_state_wander)
#endregion

//Set the default state
state_init("Wander");