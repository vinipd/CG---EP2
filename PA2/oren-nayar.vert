# version 120

attribute vec3 position;
attribute vec3 vNormal;

varying vec3 N, E;

uniform mat4 modelToWorld;
uniform mat4 worldToCamera;
uniform mat4 cameraToView;

void main() {
    mat4 chain = cameraToView * worldToCamera * modelToWorld;

    vec3 pos = (chain * vec4(position, 1.0)).xyz;

    E = normalize( pos );
    N = normalize(chain * vec4(vNormal, 1.0)).xyz;

    gl_Position = cameraToView * worldToCamera * modelToWorld * vec4(position, 1.0);
}
