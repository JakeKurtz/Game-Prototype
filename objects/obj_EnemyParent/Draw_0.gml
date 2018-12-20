// For debugging purposes.
// Draws the path created with A*
draw_self();
//if (mp_grid_path(global.grid, path, x, y, obj_Player.x, obj_Player.y, 1)) {
//	draw_path(path, x, y, false);
//}


draw_text(20,100,string_hash_to_newline("State: "+string(state_name)
              +"#x_speed: "+string(velocity[1])
			  +"#y_speed: "+string(velocity[2]))
         );