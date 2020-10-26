void setup() {
  size(800, 800);
  background(255);
  noLoop();
  noStroke();
}

void draw() {
  pushMatrix();
  translate(width / 2, height / 3);
  beginShape();
  for (float a = 0; a <= TWO_PI; a += 0.001) {
    float r = r(a) * 100;
    float x = r * cos(a);
    float y = r * sin(a);
    fill(220, 0, 0);
    vertex(x, -y);
  }
  endShape();
  popMatrix();
}

float r(float theta) {
  return (sin(theta) * sqrt(abs(cos(theta)))) / 
    (sin(theta) + 7.0 / 5.0) - 2 * sin(theta) + 2;
}
