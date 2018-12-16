/// @description Insert description here
// You can write your code in this editor
draw_self();
if (mp_grid_path(global.grid, path, x, y, obj_Player.x, obj_Player.y, 1)) {
	draw_path(path, x, y, false);
}