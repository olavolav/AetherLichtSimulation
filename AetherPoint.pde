class AetherPoint extends Point {
  float random_offset;

  AetherPoint(float xx, float yy, float zz) {
    super(xx, yy, zz);
    random_offset = randomGaussian();
  }

  float offset_x() {
    return x + random_offset * 0.1*width/AETHER_GRID_SIZE;
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
