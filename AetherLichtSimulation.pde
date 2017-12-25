float t;

void setup() {
  size(800, 600, P3D);
  lights();

  noSmooth();
  noStroke();
  sphereDetail(6);

  // Frame counter
  t = 0;
}

void draw() {
  t = t + 1;

  background(50);
  color(255);
  ambientLight(220, 93, 11);

  // camera(mouseX, height/2, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);

  for (int i = 0; i < 10; i = i+1) {
    for (int j = 0; j < 10; j = j+1) {
      for (int k = 0; k < 10; k = k+1) {
        draw_sphere(i/10.0*width, j/10.0*height, k*25);
      }
    }
  }
}

void draw_sphere(float x, float y, float z) {
  translate(x, y, z);
  sphere(20);
  translate(-x, -y, -z);
}
