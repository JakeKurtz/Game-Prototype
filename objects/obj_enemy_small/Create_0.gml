/// @description Properties

// TODO : Organize this shit

take_damage = true;
aggressive = false;
image_scale = global.image_scale;
flash = 0;
take_damage = true;
draw_blood = false
can_attack = true;
_health = 25;

default_image_speed = 0.5
image_speed = default_image_speed;
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
ANGLE_CHANGE = 0.5;
CIRCLE_DISTANCE = 100;
CIRCLE_RADIUS = 25;

SIGHT_RADIUS = 500;
MAX_SEE_AHEAD = 128;

MAX_SPEED = 2;
MAX_FORCE = 0.5;
ARRIVAL_FORCE = 1;
MAX_AVOID_FORCE = 5;
#endregion

#region // Steering vectors
position = vector(x,y);
steering = vector(0,0);
velocity = vector(0,0);
desired_velocity = vector(0,0);
avoidance = vector(0,0);
#endregion

#region // Animation arrays

idle_animations = array(spr_zombie_idle2,spr_zombie_f_idle);

walk_animations = array(spr_zombie_walk);
                 
attack_animations = array(spr_zombie_attack1,
	                      spr_zombie_attack2);
#endregion

state_machine_init();

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