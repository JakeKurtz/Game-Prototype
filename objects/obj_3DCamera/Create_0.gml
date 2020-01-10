/// @description Camera initialization

// Camera position
x = room_width/2; y = room_height/2; z = -400;

cameraPos = vec3(x, y, z);
cameraFront = vec3(0,-1,1);
cameraUp = vec3(0, 0, 1);

cameraSpeed = 4;
cameraZoom = 1;

yaw = -45;
pitch = 45;

camera = camera_create();

view_set_camera(0, camera);

camera_set_update_script(view_camera[0], camera_update);