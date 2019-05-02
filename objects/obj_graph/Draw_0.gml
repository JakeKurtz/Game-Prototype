/// @description draw edges of graph


surface_set_target(obj_surface.surface_floor);
draw_clear_alpha(c_black,0); // clear surface

for (var i = 0; i < n; i++) {
	  var id_1 = ds_list_find_value(vertex, i);
	  for (var j = 0; j < n; j++) {
		 var id_2 = ds_list_find_value(vertex, j);
	     if (edges[i,j] == 1) {
			 draw_line_width_colour(id_1.x, id_1.y, id_2.x, id_2.y, 5, color_defualt, color_defualt);	
		 } else if (edges[i,j] == 2) {
			 draw_line_width_colour(id_1.x, id_1.y, id_2.x, id_2.y, 5, color_highlight, color_highlight);				
		 }
	  }
}

surface_reset_target();
draw_surface(obj_surface.surface_floor,0,0);

show_debug_message(active_edges);