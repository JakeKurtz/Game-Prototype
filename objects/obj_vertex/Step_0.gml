/// @description setting vertex color

n = ds_list_find_index(obj_graph.active_vertices, id);

if (n == -1) image_blend = obj_graph.color_defualt;
else image_blend = obj_graph.color_highlight;