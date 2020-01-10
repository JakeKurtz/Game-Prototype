
varying vec2 Texcoord;
varying vec4 Colour;

void main() {
    gl_FragColor = Colour * texture2D( gm_BaseTexture, Texcoord );
}
