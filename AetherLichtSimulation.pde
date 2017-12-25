float x, y, z, i, j, k;
int time_ms;

int AETHER_RADIUS = 20;
int AETHER_GRID_SIZE = 8;
int LED_GRID_SIZE = 10;

// These represent points of Aether that float through space
AetherPoint[] aether_points; // = new AetherPoint[AETHER_GRID_SIZE**3];

// These are the LEDs, that light up when Aether touches them
// LedPoint[] leds; // = new LedPoint[AETHER_GRID_SIZE**3];


void setup() {
  size(800, 600, P3D);

  noSmooth();
  noStroke();
  sphereDetail(6);

  setup_aether_points();
  setup_leds();
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
void render_lights() {}

void render_aether() {
  for(AetherPoint p : aether_points) {
    x = p.x + cos((time_ms + 100*p.random_offset)*TWO_PI/4000) * width/AETHER_GRID_SIZE;
    y = p.y;
    z = p.z;
    draw_sphere(x, y, z, AETHER_RADIUS);
  }
}

void setup_aether_points() {
  aether_points = new AetherPoint[AETHER_GRID_SIZE*AETHER_GRID_SIZE*AETHER_GRID_SIZE];
  int index = 0;
  for (i = 0; i < AETHER_GRID_SIZE; i = i+1) {
    for (j = 0; j < AETHER_GRID_SIZE; j = j+1) {
      for (k = 0; k < AETHER_GRID_SIZE; k = k+1) {
        x = 1.0 * i * width/AETHER_GRID_SIZE;
        y = 1.0 * j * width/AETHER_GRID_SIZE;
        z = k * 25;
        aether_points[index] = new AetherPoint(x, y, z);
        index += 1;
      }
    }
  }
}

void setup_leds() {}
