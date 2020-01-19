/// @description Light initialization

// light position
lightPos = vec3(-200, 600, -800);

// light color
lightColor = vec3(1, 1, 1);

shadowSurf = -1;

// shadow map surface size
shadow_w = 2048;
shadow_h = 2048;

// center position of shadow map
shadow_x = room_width/2;
shadow_y = room_height/2;

// light space matrix 
lightSpaceProjection = matrix_build_projection_ortho(shadow_w, shadow_h, 1.0, 10000);
lightSpaceView = matrix_build_lookat(lightPos[0], lightPos[1], lightPos[2], shadow_x, shadow_y, 0, 0, 0, 1);
lightSpaceMatrix = matrix_multiply(lightSpaceView, lightSpaceProjection);

lightToggle = false;
