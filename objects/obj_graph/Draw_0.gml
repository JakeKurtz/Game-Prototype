/// @description draw edges of graph


surface_set_target(obj_surface.surface_floor);
draw_clear_alpha(c_black,0); // clear surface

for (var i = 0; i < n; i++) {
	  var id_1 = ds_list_find_value(vertex, i);
	  for (var j = 0; j < n; j++) {
		 var id_2 = ds_list_find_value(vertex, j);
	     if (edges[i,j] != 0) {
			 var color_num = edges[i,j];
			 var edge_color = ds_map_find_value(color, color_num);
			 draw_line_width_colour(id_1.x, id_1.y, id_2.x, id_2.y, 2.5, edge_color, edge_color);	
		 }
	  }
}

surface_reset_target();
draw_surface(obj_surface.surface_floor,0,0);

