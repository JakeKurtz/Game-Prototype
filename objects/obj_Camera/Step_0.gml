/// @description Insert description here

x = obj_Player.x;
y = obj_Player.y;

if global.camera_shake {
	var ran_x = random_range(-shake,shake);
	var ran_y = random_range(-shake,shake);
	
	camera_set_view_pos(view_camera[0], x - (camera_get_view_width(view_camera[0]) / 2) + ran_x, y - (camera_get_view_height(view_camera[0]) / 2) + ran_y);

} else camera_set_view_pos(view_camera[0], x - (camera_get_view_width(view_camera[0]) / 2), y - (camera_get_view_height(view_camera[0]) / 2));
