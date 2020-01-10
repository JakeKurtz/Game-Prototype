/// @description Lighting and shadows

// --- shadow depth map --- //
#region
if(!surface_exists(shadowSurf)) {
    shadowSurf = surface_create(shadow_w, shadow_h);
}

surface_set_target(shadowSurf);
draw_clear(c_white);
shader_set(sh_shadowMap);

shader_set_uniform_f_array( shader_get_uniform( sh_shadowMap, "lightSpaceMatrix" ), lightSpaceMatrix );

with(obj_3D) {
	matrix_set(matrix_world, modelMatrix); // sending model matrix to shader
    vertex_submit(vertexBuffer, pr_trianglelist, -1); // sending mesh to GPU
	matrix_set(matrix_world, matrix_build_identity()); // resetting model matrix after the shader is done
}

shader_reset();
surface_reset_target();
#endregion

// --- draw lighting --- //
#region
shader_set(sh_lighting);

// sending uniforms to shaders
shader_set_uniform_f_array( shader_get_uniform( sh_lighting, "lightSpaceMatrix" ), lightSpaceMatrix );
shader_set_uniform_f( shader_get_uniform( sh_lighting, "lightPos" ), lightPos[0], lightPos[1], lightPos[2]);
shader_set_uniform_f( shader_get_uniform( sh_lighting, "lightColor" ), lightColor[0], lightColor[1], lightColor[2]);
shader_set_uniform_f( shader_get_uniform( sh_lighting, "viewPos" ), obj_3DCamera.x, obj_3DCamera.y, obj_3DCamera.z);
texture_set_stage( shader_get_sampler_index( sh_lighting, "shadowMap" ), surface_get_texture( shadowSurf ) );

with(obj_3D) {
	
	matrix_set(matrix_world, modelMatrix); // sending model matrix to shader
	
	//ModelMatrixInverseTranspose = mat4_transpose(mat4_inverse(modelMatrix));
	//shader_set_uniform_f_array( shader_get_uniform( sh_lighting, "ModelMatrixInverseTranspose" ), ModelMatrixInverseTranspose );
	
	vertex_submit(vertexBuffer, pr_trianglelist, sprite_get_texture(tex, 1)); // sending mesh to GPU
	matrix_set(matrix_world, matrix_build_identity()); // resetting model matrix after the shader is done
}

shader_reset();
#endregion