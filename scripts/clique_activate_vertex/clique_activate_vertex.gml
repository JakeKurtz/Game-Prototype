var color = argument[0];
var self_id = id;
var color_value = 1;
var active_vertices;
var last_used;

with (obj_graph) {
	
	if color == "red" {
		last_used_red = self_id;
		last_used = last_used_red;
		color_value = 2;
		active_vertices = active_vertices_1;
		if (ds_list_find_index(active_vertices_2, self_id) != -1) {
			edges = reset_edges(edges, 3);
			last_used_blue = pointer_null;
			ds_list_clear(active_vertices_2);
		}
	} else if color == "blue" {
		last_used_blue = self_id;
		last_used = last_used_blue;
		color_value = 3;
		active_vertices = active_vertices_2;
		if (ds_list_find_index(active_vertices_1, self_id) != -1) {
			edges = reset_edges(edges, 2);
			last_used_red = pointer_null;
			ds_list_clear(active_vertices_1);
		}
	}
	
	ds_list_add(active_vertices, self_id);
	
	var size = ds_list_size(active_vertices);

	if (size > 1) {
		var id_1 = ds_list_find_value(active_vertices, size-2);
		var id_2 = ds_list_find_value(active_vertices, size-1);
	
		var i = ds_list_find_index(vertex, id_1);
		var j = ds_list_find_index(vertex, id_2);

		if (edges[j,i] != 0) {
			edges[j,i] = color_value;
			edges[i,j] = color_value;
			active_edges++;
		} else {
			edges = reset_edges(edges, color_value);
			last_used = pointer_null;
			active_edges = 0;
			ds_list_clear(active_vertices);
			ds_list_add(active_vertices, self_id);
		} 
	}
}