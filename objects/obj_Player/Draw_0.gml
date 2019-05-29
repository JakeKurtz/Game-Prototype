/// @description Draw Shadow and sprite

draw_shadow(18*.4,22*.2,0,8,0.75);
draw_self();

// Flash red when hit
draw_flash(flash);

// Trajectory for bombs. this shit needs work
if (bomb) {
	var trajectory_dir = point_direction(x,y,mouse_x,mouse_y);

	draw_curve(x,y,mouse_x,mouse_y,point_direction(x, y, mouse_x, mouse_y)+(cos(degtorad(trajectory_dir))*foo),64);
	draw_ellipse(mouse_x-8,mouse_y-4,mouse_x+8,mouse_y+4,1);
}
