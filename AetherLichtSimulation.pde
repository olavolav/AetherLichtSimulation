float x, y, z, i, j, k;
int time_ms;

int AETHER_RADIUS = 20;
int AETHER_GRID_SIZE = 8;
int LED_GRID_SIZE = 10;

void setup() {
  size(800, 600, P3D);

  noSmooth();
  noStroke();
  sphereDetail(6);
}

void draw() {
  time_ms = millis();

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

void draw_sphere(float x, float y, float z, float r) {
  translate(x, y, z);
  lights();
  sphere(r);
  translate(-x, -y, -z);
}

// TODO Render LED lights
void render_lights() {
}

void render_aether() {
  for (i = 0; i < AETHER_GRID_SIZE; i = i+1) {
    for (j = 0; j < AETHER_GRID_SIZE; j = j+1) {
      for (k = 0; k < AETHER_GRID_SIZE; k = k+1) {
        x = (1.0*i + cos(time_ms*TWO_PI/4000)) * width/AETHER_GRID_SIZE;
        y = 1.0*j/AETHER_GRID_SIZE*height;
        z = k * 25;
        draw_sphere(x, y, z, AETHER_RADIUS);
      }
    }
  }
}
