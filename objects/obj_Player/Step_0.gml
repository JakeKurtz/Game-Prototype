/// @description  Animation and Movment Controller

// TODO : Make the collsions less clunky

position = vector(x,y);
velocity = vector(x_speed,y_speed);

#region // MOVEMENT INPUT

up_key = keyboard_check(ord("W"));
down_key = keyboard_check(ord("S"));
left_key = keyboard_check(ord("A"));
right_key = keyboard_check(ord("D"));
dash_key = keyboard_check_pressed(vk_space);
atk_light_key = mouse_check_button_pressed(mb_left);
atk_hard_key = mouse_check_button_pressed(mb_right);

attack_key = (atk_light_key || atk_hard_key);

#endregion

#region // Getting direction of player
if WASD_enabled {	
	if up_key                  facing = 0;
	if left_key                facing = 1;
	if right_key               facing = 2;
	if down_key                facing = 3;
	if (up_key && left_key)    facing = 0;
	if (up_key && right_key)   facing = 0;
	if (down_key && left_key)  facing = 3;
	if (down_key && right_key) facing = 3;
} #endregion

depth = -y;

image_blend = make_colour_rgb(0, 255, 0);

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