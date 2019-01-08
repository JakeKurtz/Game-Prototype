/// @description Insert description here
// You can write your code in this editor
aggressive = false;
take_damage = true;
flash = 0;
default_image_speed = 0.5;
_health = 50;
image_scale = global.image_scale;
can_attack = true;

image_speed = 0.5;
image_xscale = image_xscale*image_scale;
image_yscale = image_yscale*image_scale;

path = path_add();
path_patrol = path0;

r_attack_range = 250;
m_attack_range = 5;
flee_range = 100;

my_path_dir = 1;
my_path_position = 0;
facing = 0;
can_seek = true;

shadow_size = 1;
shadow_height = 45*shadow_size; 
shadow_width = 40*shadow_size;

#region // Steering constants
MASS = 5;
ANGLE_CHANGE = 0.25;
CIRCLE_DISTANCE = 2;
CIRCLE_RADIUS = 8;

SIGHT_RADIUS = 500;
MAX_SEE_AHEAD = 128;

MAX_SPEED = 4;
MAX_FORCE = 1;
ARRIVAL_FORCE = 1;
MAX_AVOID_FORCE = 0.5;
#endregion

#region // Steering vectors
position = vector(x,y);
steering = vector(0,0);
velocity = vector(0,0);
desired_velocity = vector(0,0);
avoidance = vector(0,0);
#endregion

#region // Animation arrays
idle_animations = array(spr_glad_idle);

walk_animations = array(spr_glad_walk);
                 
attack_animations = array(spr_glad_attack);
#endregion

state_machine_init();

#region //Define States
state_create("Patrol",enemyRanged_state_patrol);
state_create("Idle",enemyRanged_state_idle);
state_create("Pursue",enemyRanged_state_pursue);
state_create("Ranged Attack",enemyRanged_state_attackRanged);
state_create("Melee Attack",enemyRanged_state_attackMelee);
state_create("Flee",enemyRanged_state_flee);
state_create("Stun", enemyRanged_state_stun);
state_create("Die", enemyRanged_state_die);
state_create("Follow", enemyRanged_state_follow);
#endregion

//Set the default state
state_init("Follow");