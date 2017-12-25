float x,y,z;

void setup() {
  size(640,360,P3D);
  background(0);
  lights();

  //x = width/2;
  //y = height/2;
  //t = 0;
  noSmooth();
  noStroke();
}

void draw() {
  color(255);
  // point(x,y,z);

  for (int i = 0; i < 10; i = i+1) {
    for (int j = 0; j < 10; j = j+1) {
      for (int k = 0; k < 10; k = k+1) {
        translate(i*25, -1*j*25, -1*k*25);
        sphere(2);
      }
    }
  }

  // rectMode(CENTER);
  // rect(0,0,100,100);

  //t++; // The rectangle moves forward as z increments.
}
