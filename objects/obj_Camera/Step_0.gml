/// @description

// Follow Player
x = obj_player.x;
y = obj_player.y;

// Shake effect
if global.camera_shake {
	var ran_x = random_range(-shake_intensity, shake_intensity);
	var ran_y = random_range(-shake_intensity, shake_intensity);
	
	camera_set_view_pos(view_camera[0], x - (camera_get_view_width(view_camera[0]) / 2) + ran_x, y - (camera_get_view_height(view_camera[0]) / 2) + ran_y);

} else camera_set_view_pos(view_camera[0], x - (camera_get_view_width(view_camera[0]) / 2), y - (camera_get_view_height(view_camera[0]) / 2));
