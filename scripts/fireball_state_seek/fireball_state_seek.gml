steering = vector_add(velocity, sb_seek(obj_player.x, obj_player.y, 1));
steering = vector_truncate(steering, MAX_FORCE);
steering = vector_divr(steering, MASS);
velocity = vector_truncate(vector_add(velocity, steering), MAX_SPEED);

direction = vector_direction(velocity);

x += velocity[1];
y += velocity[2];

if place_meeting(x,y,obj_solid_nonentity) || place_meeting(x,y,obj_player) state_switch("Die");