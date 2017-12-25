float x, y, z, i, j, k;
int time_ms;

int AETHER_RADIUS = 40;
int LED_RADIUS = 3;
int AETHER_GRID_SIZE = 5;
int LED_GRID_SIZE = 10;

// These represent points of Aether that float through space
AetherPoint[] aether_points; // = new AetherPoint[AETHER_GRID_SIZE**3];

// These are the LEDs, that light up when Aether touches them
LedPoint[] leds; // = new LedPoint[AETHER_GRID_SIZE**3];

// This represents the global periodic movement of the Aether
GlobalWave global_wave;

void setup() {
  size(800, 600, P3D);

  noSmooth();
  noStroke();
  sphereDetail(4);

  setup_aether_points();
  setup_leds();

  global_wave = new GlobalWave(4000.0);
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

void render_lights() {
  float min_distance, distance_here;

  for(LedPoint l : leds) {
    min_distance = width;
    for(AetherPoint p : aether_points) {
      x = p.offset_x() + global_wave.offset_x(time_ms);
      y = p.offset_y() + global_wave.offset_y(time_ms);
      z = p.offset_z() + global_wave.offset_z(time_ms);
      distance_here = point_distance(x, y, z, l.offset_x(), l.offset_y(), l.offset_z());

      if(distance_here < min_distance) {
        min_distance = distance_here;
      }
    }

    if(min_distance < AETHER_RADIUS) {
      draw_sphere(l.offset_x(), l.offset_y(), l.offset_z(), LED_RADIUS);
    } else {
      draw_sphere(l.offset_x(), l.offset_y(), l.offset_z(), 1);
    }
  }
}

void render_aether() {
  for(AetherPoint p : aether_points) {
    x = p.offset_x() + global_wave.offset_x(time_ms);
    y = p.offset_y() + global_wave.offset_y(time_ms);
    z = p.offset_z() + global_wave.offset_z(time_ms);
    draw_sphere(x, y, z, AETHER_RADIUS);
  }
}

void draw_sphere(float x, float y, float z, float r) {
  translate(x, y, z);
  lights();
  sphere(r);
  translate(-x, -y, -z);
}
