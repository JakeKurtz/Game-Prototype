/// @description Insert description here
// You can write your code in this editor

path = path_add();
path_patrol = path0;

position = vector(x,y);

MASS = 5;
ANGLE_CHANGE = 0.25;
CIRCLE_DISTANCE = 2;
CIRCLE_RADIUS = 8;

SIGHT_RADIUS = 500;

MAX_SEE_AHEAD = 128;

MAX_SPEED = 4;
MAX_FORCE = 5;
ARRIVAL_FORCE = 1;
MAX_AVOID_FORCE = 10;

steering		 = vector(0,0);
velocity		 = vector(0,0);
desired_velocity = vector(0,0);
avoidance		 = vector(0,0);

attack_range = 32;

my_path_dir = 1;
facing = 0;
can_seek = false;
my_path_position = 0;

shadow_size = 1;
shadow_height = 45*shadow_size; 
shadow_width = 40*shadow_size;

// Animation arrays
walk_animations = array(spr_enemy,
                        spr_enemy,
                        spr_enemy,
                        spr_enemy);
                 
attack_animations = array(spr_enemy,
	                      spr_enemy,
	                      spr_enemy,
	                      spr_enemy);

state_machine_init();

//Define States
state_create("Patrol",enemy_state_patrol);
state_create("Idle",enemy_state_idle);
state_create("Pursue",enemy_state_pursue);
state_create("Attack",enemy_state_attack);

//Set the default state
state_init("Patrol");