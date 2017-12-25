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

float point_distance(float x1, float y1, float z1, float x2, float y2, float z2) {
  return sqrt(pow(x1-x2,2) + pow(y1-y2,2) + pow(z1-z2,2));
}
