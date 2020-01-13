/// @description Insert description here
// You can write your code in this editor
event_inherited();
//Begin defining a format
vertex_format_begin();

vertex_format_add_position_3d();	//Add 3D position info
vertex_format_add_normal();
vertex_format_add_color();			//Add color info
vertex_format_add_texcoord();		//Texture coordinate info

//End building the format, and assign the format to the variable "format"
format = vertex_format_end();

//Create the vertex buffer. Another function, vetex_create_buffer_ext can be used to create the buffer with its size predefined and fixed. 
//With the standard vertex_create_buffer, the buffer will just grow automatically as needed.
vb_plane = vertex_create_buffer();

//Begin building the buffer using the format defined previously
vertex_begin(vb_plane, format);

//Using size to keep it square if we decide to change how big it is.
//var size = 1;

//Add the six vertices needed to draw a simple square plane. 
//The normals are all pointing to (0,0,-1) (upward, in our case)

//The first triangle
/*vertex_position_3d(vb_plane, size, 0, 0);
vertex_normal(vb_plane, 0, 0, -1);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 0, 0);

vertex_position_3d(vb_plane, -size, 0, 0);
vertex_normal(vb_plane, 0, 0, -1);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 1, 0);

vertex_position_3d(vb_plane, size, 2*size, 0);
vertex_normal(vb_plane, 0, 0, -1);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 0, 1);

//The second triangle. The winding order has been maintained so drawing is consistent if culling is enabled.
vertex_position_3d(vb_plane, size, 2*size, 0);
vertex_normal(vb_plane, 0, 0, -1);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 0, 1);

vertex_position_3d(vb_plane, -size, 0, 0);
vertex_normal(vb_plane, 0, 0, -1);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 1, 0);

vertex_position_3d(vb_plane, -size, 2*size, 0);
vertex_normal(vb_plane, 0, 0, -1);
vertex_color(vb_plane, c_white, 1);
vertex_texcoord(vb_plane, 1, 1);

//Finish building the buffer.
vertex_end(vb_plane);
*/
tex = spr_plane;
vertexBuffer = obj_loader("plane.obj");
modelMatrix = matrix_build(x, y, 0, 0, 0, 0, image_xscale*64, image_yscale*64, 1);