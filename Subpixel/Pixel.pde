class Pixel {
  int x, y;

  color r, g, b;

  Pixel(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void setColor(color c) {
    this.r = (int)red(c);
    this.g = (int)green(c);
    this.b = (int)blue(c);
  }

  void draw() {
    pushMatrix();
    pushStyle();
    noStroke();
    float ln = PSZ / 3.0;
    float spacing = 0;
    
    fill(r, 0, 0);
    translate(x, y);
    rect(0, 0, ln, PSZ);
    
    fill(0, g, 0);
    translate(ln + spacing, 0);
    rect(0, 0, ln, PSZ);

    fill(0, 0, b);
    translate(ln + spacing, 0);
    rect(0, 0, ln, PSZ);
    popStyle();
    popMatrix();
  }
}
