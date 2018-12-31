/// @description Insert description here
// You can write your code in this editor

image_scale = 2;

image_speed = 0.5;
image_xscale = image_xscale*image_scale;
image_yscale = image_yscale*image_scale;

path = path_add();
path_patrol = path0;

m_attack_range = 5;
r_attack_range = 32;
flee_range = 200;

my_path_dir = 1;
my_path_position = 0;
facing = 0;
can_seek = false;

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

MAX_SPEED = 2;
MAX_FORCE = 0.3;
ARRIVAL_FORCE = 1;
MAX_AVOID_FORCE = 1;
#endregion

#region // Steering vectors
position = vector(x,y);
steering = vector(0,0);
velocity = vector(0,0);
desired_velocity = vector(0,0);
avoidance = vector(0,0);
#endregion

#region // Animation arrays

idle_animations = array(spr_zombie_idle2);

walk_animations = array(spr_zombie_walk);
                 
attack_animations = array(spr_zombie_attack1,
	                      spr_zombie_attack2);
#endregion

state_machine_init();

#region //Define States
state_create("Patrol",enemy_state_patrol);
state_create("Pursue",enemy_state_pursue);
state_create("Idle",enemy_state_idle);
state_create("Idle Attack", enemy_small_state_idle_attack);
state_create("Attack",enemy_state_m_attack);
state_create("Flee",enemy_small_state_flee);
state_create("Follow",enemy_small_state_follow);
#endregion

//Set the default state
state_init("Follow");