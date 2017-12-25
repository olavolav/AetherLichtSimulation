float t;

int AETHER_RADIUS = 20;
int GRID_SIZE = 10;

void setup() {
  size(800, 600, P3D);

  noSmooth();
  noStroke();
  sphereDetail(6);

  // Frame counter
  t = 0;
}

void draw() {
  t = t + 1;

  background(50);
  color(255);
  ambientLight(220, 93, 11);

  // camera(mouseX, height/2, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);

  if(mousePressed) {
    render_aether();
  } else {
    render_lights();
  }
}

void draw_sphere(float x, float y, float z) {
  translate(x, y, z);
  lights();
  sphere(AETHER_RADIUS);
  translate(-x, -y, -z);
}

// TODO Render LED lights
void render_lights() {
}

void render_aether() {
  for (int i = 0; i < GRID_SIZE; i = i+1) {
    for (int j = 0; j < GRID_SIZE; j = j+1) {
      for (int k = 0; k < GRID_SIZE; k = k+1) {
        draw_sphere(1.0*i/GRID_SIZE*width, 1.0*j/GRID_SIZE*height, k*25);
      }
    }
  }
}
