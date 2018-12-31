/// @description  Animation and Movment Controller

// TODO : Make the collsions less clunky

position = vector(x,y);
velocity = vector(x_speed,y_speed);

#region // MOVEMENT INPUT

key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_dash = keyboard_check_pressed(vk_space);
key_atk_light = mouse_check_button_pressed(mb_left);
key_atk_hard = mouse_check_button_pressed(mb_right);

key_attack = (key_atk_light || key_atk_hard);

#endregion

#region // Getting direction of player
if WASD_enabled {	
	if key_up                  facing = 0;
	if key_left               facing = 1;
	if key_right               facing = 2;
	if key_down                facing = 3;
	if (key_up && key_left)    facing = 0;
	if (key_up && key_right)   facing = 0;
	if (key_down && key_left)  facing = 3;
	if (key_down && key_right) facing = 3;
} #endregion

if (key_left) image_xscale = -image_scale;
else if (key_right) image_xscale = image_scale;

depth = -y;

// Decelerating movement
if (x_speed != 0) x_speed -= (walk_decel * sign(x_speed))
if (y_speed != 0) y_speed -= (walk_decel * sign(y_speed))

#region // horizontal collision
if (place_meeting(x+x_speed,y,obj_solid_nonentity)) {
    while(!place_meeting(x+sign(x_speed),y,obj_solid_nonentity)) x += sign(x_speed);
	if (state_name == "Dash") global.camera_shake = true;
    x_speed = 0;
} #endregion
x += x_speed;
 
#region // vertical collision
if (place_meeting(x,y+y_speed,obj_solid_nonentity)) {
    while(!place_meeting(x,y+sign(y_speed),obj_solid_nonentity)) y += sign(y_speed);
	if (state_name == "Dash") global.camera_shake = true;
    y_speed = 0;
} #endregion
y += y_speed;

//if (place_meeting(x,y,obj_enemy_parent) && state_name == "Dash") global.camera_shake = true;

state_execute();