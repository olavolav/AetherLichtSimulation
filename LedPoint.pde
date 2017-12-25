class LedPoint extends Point {
  LedPoint(float xx, float yy, float zz) {
    super(xx, yy, zz);
  }
}

void setup_leds() {
  leds = new LedPoint[LED_GRID_SIZE*LED_GRID_SIZE*LED_GRID_SIZE];
  int index = 0;
  for (i = 0; i < LED_GRID_SIZE; i = i+1) {
    for (j = 0; j < LED_GRID_SIZE; j = j+1) {
      for (k = 0; k < LED_GRID_SIZE; k = k+1) {
        x = 1.0 * i * width/LED_GRID_SIZE;
        y = 1.0 * j * width/LED_GRID_SIZE;
        z = k * 25;
        leds[index] = new LedPoint(x, y, z);
        index += 1;
      }
    }
  }
}
