class GlobalWave {
  float period;

  GlobalWave(float p) {
    period = p;
  }

  float offset_x(float t) {
    return cos(t * TWO_PI/period) * width/AETHER_GRID_SIZE;
  }

  float offset_y(float t) {
    return cos(t * TWO_PI/(10*period)) * height/(10*AETHER_GRID_SIZE);
  }

  float offset_z(float t) {
    return 0.0;
  }
}
