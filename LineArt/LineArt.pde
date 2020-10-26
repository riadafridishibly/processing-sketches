int W, H, m;

void settings() {
  W = 8 * 2;
  H = 6 * 2;
  m = 100;
  size(W * m, H * m);
}

void setup() {
  background(0);
  stroke(255);
  colorMode(HSB, 360, 100, 100);
  strokeCap(PROJECT);
  strokeWeight(20);
  //noFill();
  drawGrid();
}

void draw() {
  if (keyPressed && key == 'r') {
    drawGrid();
  }
}

void drawGrid() {
  background(0);
  for (int y = 0; y < H; ++y) {
    for (int x = 0; x < W; ++x) {
      float xx = x * m + m / 2;
      float yy = y * m + m / 2;
      push();
      translate(xx, yy);

      int len = m / 2;
      int rn = getRandomIndex();
      //stroke((sin(x * y) / 2 + 0.5) * 360, 5, 100);
      //fill((sin(x * y) / 2 + 0.5) * 360, 5, 100);
      stroke(100);
      fill(0);
      switch (rn) {
      case 0: 
        line(-len, -len, len, len);
        //line(-len, 0, len, 0);
        circle(0, 0, 10);

        break;
      case 1: 
        line(-len, -len, len, len); 
        line(-len, len, len, -len);
        //line(-len, 0, len, 0);
        //line(0, -len, 0, len);
        circle(0, 0, 10);

        break;
      case 2:
        line(-len, len, len, -len);
        //line(0, -len, 0, len);
        circle(0, 0, 10);

        break;
      case 3:
        //line(0, -len, 0, len);
        break;
      }
      pop();
    }
  }
}

int getRandomIndex() {
  float rval = random(1);
  if (rval < 0.5)
    return 0;
  else if (rval < 0.8)
    return 1;
  else if (rval < 1)
    return 2;
  else return 3;
}


void keyPressed() {
  if (key == 's') {
    String name = "frames/saved####.png";
    saveFrame(name);
    println("Saved " + name);
  }
}
