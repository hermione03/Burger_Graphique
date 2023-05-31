#version 330

layout(location = 0) in vec3 pos;
layout(location = 1) in vec3 normal;
layout(location = 2) in vec2 texCoord;

out vec4 mpos;
out vec3 mnormal;
out vec2 tcoord;

uniform mat4 proj, model, view;
uniform vec3 text_position; // New uniform

void main() {
  vec4 adjustedPos = model * vec4(pos + text_position, 1.0); // Add text_position to pos before multiplying with model matrix
  mpos = adjustedPos;
  mnormal = normalize(transpose(inverse(model)) * vec4(normal, 0.0)).xyz;
  gl_Position = proj * view * mpos;
  tcoord = vec2(texCoord.x, (1.0 - texCoord.y));
}
