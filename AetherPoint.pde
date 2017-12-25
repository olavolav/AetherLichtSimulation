class AetherPoint extends Point {
  float random_offset;

  AetherPoint(float xx, float yy, float zz) {
    super(xx, yy, zz);
    random_offset = randomGaussian();
  }
}
