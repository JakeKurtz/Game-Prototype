/// @description Light initialization

// light position
lightPos = vec3(room_width/2, room_height/2, -500);

// light color
lightColor = vec3(1, 0, 0);

shadowSurf = -1;

// shadow map surface size
shadow_w = 2048;
shadow_h = 2048;

// center position of shadow map
shadow_x = room_width/2;
shadow_y = room_height/2;

// light space matrix 
shadow_projectionMatrix = matrix_build_projection_ortho(shadow_w, shadow_h, 1.0, 10000);
shadow_viewMatrix = matrix_build_lookat(lightPos[0], lightPos[1], lightPos[2], shadow_x, shadow_y, 0, 0, 0, 1);
lightSpaceMatrix = matrix_multiply(shadow_viewMatrix, shadow_projectionMatrix);
