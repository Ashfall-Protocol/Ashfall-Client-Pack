#version 330 core

#import <sodium:include/fog.glsl>

in vec4 v_Color; // The interpolated vertex color
in vec2 v_TexCoord; // The interpolated block texture coordinates
in vec3 v_BioColor; // The natural vertex tint color
in float v_FragDistance; // The fragment's distance from the camera

in float v_MaterialMipBias;
in float v_MaterialAlphaCutoff;

uniform sampler2D u_BlockTex; // The block texture

uniform vec4 u_FogColor; // The color of the shader fog
uniform float u_FogStart; // The starting position of the shader fog
uniform float u_FogEnd; // The ending position of the shader fog

out vec4 fragColor; // The output fragment for the color framebuffer

void main() {
    vec4 diffuseColor = texture(u_BlockTex, v_TexCoord, v_MaterialMipBias);

#ifdef USE_FRAGMENT_DISCARD
    if (diffuseColor.a < v_MaterialAlphaCutoff) {
        discard;
    }
#endif

    vec3 naturalColor = diffuseColor.rgb * v_BioColor;

#ifdef USE_VANILLA_COLOR_FORMAT
    // Apply per-vertex color. AO shade is applied ahead of time on the CPU.
    diffuseColor *= v_Color;
    float ao = 1.0;
#else
    // Apply per-vertex color
    diffuseColor.rgb *= v_Color.rgb;

    // Apply ambient occlusion "shade"
    float ao = v_Color.a;
    diffuseColor.rgb *= ao;
#endif

    // Player proximity halo: close objects are softly visible, fading smoothly into total blackness
    const float HALO_RADIUS = 6.0;
    if (v_FragDistance < HALO_RADIUS) {
        float proximity = 1.0 - (v_FragDistance / HALO_RADIUS);
        float halo = proximity * proximity;
        // Soft aura brightness (~32% max) preserving genuine pitch darkness beyond 6 blocks
        vec3 haloLight = naturalColor * (ao * halo * 0.32);
        diffuseColor.rgb = max(diffuseColor.rgb, haloLight);
    }

    fragColor = _linearFog(diffuseColor, v_FragDistance, u_FogColor, u_FogStart, u_FogEnd);
}
