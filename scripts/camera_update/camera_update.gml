
with(obj_3DCamera){
	
	var viewMat = matrix_build_lookat(cameraPos[0], cameraPos[1], cameraPos[2], 
									  cameraDir[0], cameraDir[1], cameraDir[2], 
									  cameraUp[0],  cameraUp[1],  cameraUp[2]);
									  
	var projMat = matrix_build_projection_ortho(view_get_wport(0) * cameraZoom, view_get_hport(0) * cameraZoom, 1.0, 32000.0);
	//var projMat = matrix_build_projection_perspective_fov(60, view_get_wport(0)/view_get_hport(0), 1, 1000);
	
	camera_set_proj_mat(camera, projMat);
	camera_set_view_mat(view_camera[0],viewMat);
}