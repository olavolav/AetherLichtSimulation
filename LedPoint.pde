class LedPoint extends Point {
  LedPoint(float xx, float yy, float zz) {
    super(xx, yy, zz);
  }
}

// Not used right now
void setup_leds_on_grid() {
  leds = new LedPoint[LED_GRID_SIZE*LED_GRID_SIZE*LED_GRID_SIZE];
  int index = 0;
  for (i = 0; i < LED_GRID_SIZE; i = i+1) {
    for (j = 0; j < LED_GRID_SIZE; j = j+1) {
      for (k = 0; k < LED_GRID_SIZE; k = k+1) {
        x = 1.0 * i * width/LED_GRID_SIZE;
        y = 1.0 * j * height/LED_GRID_SIZE;
        z = -1.0 * (k * height/AETHER_GRID_SIZE + DEPTH_OFFSET_OF_ROOM);
        leds[index] = new LedPoint(x, y, z);
        index += 1;
      }
    }
  }
}

void setup_leds_randomly() {
  leds = new LedPoint[LED_GRID_SIZE*LED_GRID_SIZE*LED_GRID_SIZE];
  for (i = 0; i < LED_GRID_SIZE*LED_GRID_SIZE*LED_GRID_SIZE; i = i+1) {
    x = random(width);
    y = random(height);
    z = -1.0 * (random(height) + DEPTH_OFFSET_OF_ROOM);
    leds[i] = new LedPoint(x, y, z);
  }
}
