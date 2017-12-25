class Point {
  float x;
  float y;
  float z;

  Point(float xx, float yy, float zz) {
    x = xx;
    y = yy;
    z = zz;
  }

  float offset_x() { return x; }
  float offset_y() { return y; }
  float offset_z() { return z; }
}
