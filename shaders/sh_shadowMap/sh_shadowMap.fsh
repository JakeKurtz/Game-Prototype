varying float depth;

vec3 depth_to_col ( float depth ) {
    float R = floor(depth*255.9999847412109375);
    float G = floor(depth*65535.99609375 - R*256.0);
    float B = floor(depth*16777215.0 - R*65536.0 - G*256.0);
    return vec3(R,G,B)/255.0;
}

void main() {
    gl_FragColor = vec4 (depth_to_col(depth), 1.0 );
}

