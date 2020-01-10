
attribute vec3 in_Position;
attribute vec4 in_Colour;
attribute vec2 in_TextureCoord;

varying vec2 Texcoord;
varying vec4 Colour;

//uniform vec3 spritePos;

void main() {
	
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
    //gl_Position.xy += in_Position.xy * vec2(gm_Matrices[MATRIX_PROJECTION][0][0], -gm_Matrices[MATRIX_PROJECTION][1][1]);
    Colour = in_Colour;
    Texcoord = in_TextureCoord;
}


