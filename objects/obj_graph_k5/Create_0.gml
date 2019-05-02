event_inherited();

// list of all active vertices
active_vertices = ds_list_create();
active_edges = 0;

// number of vertices
n = instance_number(obj_vertex);

// number of edges
e = 10;

// set edges
edges = init_edges(n,n);

if (instance_number(obj_vertex) >= 5) {
	add_edge(0,1);
	add_edge(0,2);
	add_edge(0,3);
	add_edge(0,4);
	add_edge(1,2);
	add_edge(1,3);
	add_edge(1,4);
	add_edge(2,3);
	add_edge(2,4);
	add_edge(2,0);
	add_edge(3,4);
}

// getting all instances into a list
vertex = ds_list_create();

for (var i = 0; i < n; i ++) {
   ds_list_add(vertex, instance_find(obj_vertex, i));
}