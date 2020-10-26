
Block b1, b2;

long timeStep = 10000;

void setup() {
  size(600, 400, FX2D);
  strokeWeight(1);
  b1 = new Block(50, height - 100 - 30, 1, 0, 30, 30);
  b2 = new Block(200, height - 100 - 90, pow(100, 5), -1.0 / timeStep, 80, 90);
  b1.setConstrain(10);
  b2.setConstrain(b1.w + 10);
}

int count = 0;

void draw() {
  background(255);
  line(10, 0, 10, height);
  line(0, height - 100, width, height - 100);


  for (int i = 0; i < timeStep; ++i) {
    b1.update();
    b2.update();

    if (b1.collide(b2)) {
      float v1 = b1.bounce(b2);
      float v2 = b2.bounce(b1);

      b1.velocity = v1;
      b2.velocity = v2;

      count++;
    }

    if (b1.hitWall()) {
      b1.velocity = -b1.velocity;
      count++;
    }
  }

  fill(0);
  textSize(32);
  text(nf(count, 6), 100, 40);

  b1.show();
  b2.show();
}
