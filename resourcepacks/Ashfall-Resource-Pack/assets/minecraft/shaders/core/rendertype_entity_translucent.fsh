#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec4 lightMapColor;
in vec4 overlayColor;
in vec2 texCoord0;
in vec4 normal;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0);
    color *= vertexColor * ColorModulator;
    color.rgb = mix(overlayColor.rgb, color.rgb, overlayColor.a);
    vec4 litColor = color * lightMapColor;

    const float HALO_RADIUS = 6.0;
    if (vertexDistance < HALO_RADIUS) {
        float proximity = 1.0 - (vertexDistance / HALO_RADIUS);
        float halo = proximity * proximity;
        litColor.rgb = max(litColor.rgb, color.rgb * (halo * 0.32));
    }

    fragColor = linear_fog(litColor, vertexDistance, FogStart, FogEnd, FogColor);
}
