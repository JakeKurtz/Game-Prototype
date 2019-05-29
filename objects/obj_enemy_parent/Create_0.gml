/// @description Enemy properties skeleton

//hurtbox
//hurtbox = hurtbox_create(18,24,-9,-12);

//hitbox
hitbox = -1;

hit = false;
hitStun = 0;
hitBy = -1;

explode = false;

path = path_add();
path_patrol = path0;

image_scale = global.image_scale;
default_image_speed = 0.5;
_health = 0;
strength = _health;

speed_flee = 1;
speed_follow = 1;
speed_patrol = 1;
speed_pursue = 1;
speed_wander = 1;

#region // Steering constants
MASS = 15;
ANGLE_CHANGE = 0.25;
CIRCLE_DISTANCE = 2;
CIRCLE_RADIUS = 8;

SIGHT_RADIUS = 500;
MAX_SEE_AHEAD = 128;

SPEED = 2;
MAX_FORCE = 10;
ARRIVAL_FORCE = 1;
MAX_AVOID_FORCE = 10;
#endregion

#region // Steering vectors
position		 = vector(x,y);
steering		 = vector(0,0);
velocity		 = vector(0,0);
desired_velocity = vector(0,0);
avoidance		 = vector(0,0);
#endregion

my_path_dir = 1;
facing = 0;
flash = 0;
can_seek = false;

r_attack_range = -1;
m_attack_range = -1;
flee_range = -1;

image_speed = default_image_speed;
image_xscale = image_xscale*image_scale;
image_yscale = image_yscale*image_scale;

// Format
//	key: attack_animation
//	value: vector(min_frame, max_frame)
hitbox_range = ds_map_create();

state_machine_init();

#region //Define States
state_create("Patrol",e_state_patrol);
state_create("Idle",e_state_idle);
state_create("Pursue",e_state_pursue);
state_create("Ranged Attack",e_state_attackRanged);
state_create("Melee Attack",e_state_attackMelee);
state_create("Flee",e_state_flee);
state_create("Stun", e_state_stun);
state_create("Die", e_state_die);
state_create("Follow", e_state_follow);
state_create("Wander", e_state_wander)
#endregion