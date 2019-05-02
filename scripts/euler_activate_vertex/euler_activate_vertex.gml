var self_id = id;

with (obj_graph) {
	ds_list_add(active_vertices, self_id);
	
	var size = ds_list_size(active_vertices);

	if (size > 1) {
		var id_1 = ds_list_find_value(active_vertices, size-2);
		var id_2 = ds_list_find_value(active_vertices, size-1);
	
		var i = ds_list_find_index(vertex, id_1);
		var j = ds_list_find_index(vertex, id_2);

		if (edges[j,i] == 1) {
			edges[j,i] = 2;
			edges[i,j] = 2;
			active_edges++;
		} else {
			edges = reset_edges(edges);
			active_edges = 0;
			ds_list_clear(active_vertices);
			ds_list_add(active_vertices, self_id);
		} 
		
		// checking for cycle. needed for euler circuits
		if (e == active_edges && ds_list_find_value(active_vertices, 0) != ds_list_find_value(active_vertices, ds_list_size(active_vertices)-1)) {
			edges = reset_edges(edges);
			active_edges = 0;
			ds_list_clear(active_vertices);
			ds_list_add(active_vertices, self_id);
		}
	}
}