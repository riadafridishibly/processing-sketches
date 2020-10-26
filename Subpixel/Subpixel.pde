final static int PSZ = 9;

PImage img;

int W;
int H;

Pixel[] px;

void setup() {
  size(810, 810);
  W = width / PSZ;
  H = height / PSZ;
  px = new Pixel[W * H];

  img = loadImage("panda.jpg");
  img.resize(W, 0);
  img.loadPixels();

  noStroke();
  for (int j = 0; j < H; ++j) {
    for (int i = 0; i < W; ++i) {
      px[i + j * W] = new Pixel(i * PSZ, j * PSZ);
      px[i + j * W].setColor(img.pixels[i + j * W]);
    }
  }
}


void draw() {
  background(255);
  for (int i = 0; i < W; ++i) {
    for (int j = 0; j < H; ++j) {
      px[i + j * W].draw();
    }
  }
}
