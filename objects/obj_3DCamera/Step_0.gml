/// @description Camera controls

offset = vec3(0, 200, -200);
targetPos = vec3(obj_player.x, obj_player.y, obj_player.z);
smoothedPos = lerpVec3(cameraPos, vecAdd(targetPos, offset), smoothSpeed);

cameraPos = smoothedPos;
cameraDir = vecAdd(cameraPos, cameraFront);

// === Camera Translation === //

//if keyboard_check(ord("W")) cameraPos = matrix_vector_mul(matrix_build(0,-cameraSpeed,0,0,0,0,1,1,1), cameraPos);
//if keyboard_check(ord("S")) cameraPos = matrix_vector_mul(matrix_build(0,cameraSpeed,0,0,0,0,1,1,1), cameraPos);
//if keyboard_check(ord("A")) cameraPos = matrix_vector_mul(matrix_build(-cameraSpeed,0,0,0,0,0,1,1,1), cameraPos);
//if keyboard_check(ord("D")) cameraPos = matrix_vector_mul(matrix_build(cameraSpeed,0,0,0,0,0,1,1,1), cameraPos);

// === Camera Rotation === //

if keyboard_check(ord("I")) pitch += 1;
if keyboard_check(ord("K")) pitch -= 1;

if keyboard_check(ord("J")) yaw += 1;
if keyboard_check(ord("L")) yaw -= 1;

if(pitch > 89.0) pitch = 89.0;
if(pitch < -89.0) pitch = -89.0;

dir[0] = cos(degtorad(yaw)) * cos(degtorad(pitch));
dir[1] = sin(degtorad(yaw)) * cos(degtorad(pitch));
dir[2] = sin(degtorad(pitch));
cameraFront = normalize(dir);

