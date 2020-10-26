final static int CHIP8_W = 64;
final static int CHIP8_H = 32;

final static int RECT_SIZE = 10;

short[] fonts = {
  0xF0, 0x90, 0x90, 0x90, 0xF0, // 0
  0x20, 0x60, 0x20, 0x20, 0x70, // 1
  0xF0, 0x10, 0xF0, 0x80, 0xF0, // 2
  0xF0, 0x10, 0xF0, 0x10, 0xF0, // 3
  0x90, 0x90, 0xF0, 0x10, 0x10, // 4
  0xF0, 0x80, 0xF0, 0x10, 0xF0, // 5
  0xF0, 0x80, 0xF0, 0x90, 0xF0, // 6
  0xF0, 0x10, 0x20, 0x40, 0x40, // 7
  0xF0, 0x90, 0xF0, 0x90, 0xF0, // 8
  0xF0, 0x90, 0xF0, 0x10, 0xF0, // 9
  0xF0, 0x90, 0xF0, 0x90, 0x90, // A
  0xE0, 0x90, 0xE0, 0x90, 0xE0, // B
  0xF0, 0x80, 0x80, 0x80, 0xF0, // C
  0xE0, 0x90, 0x90, 0x90, 0xE0, // D
  0xF0, 0x80, 0xF0, 0x80, 0xF0, // E
  0xF0, 0x80, 0xF0, 0x80, 0x80, // F
};


color[] ch_pixels;

void settings() {
  size(CHIP8_W * RECT_SIZE, CHIP8_H * RECT_SIZE);
}

void setup() {
  ch_pixels = new color[CHIP8_H * CHIP8_W];

  //for (int i = 0; i < 10; ++i) {
  //  for (int j = 0; j < 10; ++j) {
  //    ch_pixels[j + i * 64] = 1;
  //  }
  //}

  for (int i = 0; i < ch_pixels.length; ++i) {
    //ch_pixels[i] = color(random(0, 255));
  }
  noStroke();
  //noLoop();
  //rectMode(CENTER);
}


int[] f = new int[12];
void draw() {
  //for (int i = 0; i < ch_pixels.length; ++i) ch_pixels[i] = 0;
  for (int i = 0; i < f.length; ++i) {
    drawGraphicsTempu( i * 5 + 3, CHIP8_H / 2 - 4, f[i] * 5, fonts, ch_pixels);
    drawGraphics(ch_pixels);
  }
  if (frameCount % 30 == 0) {
    for (int i = 0; i < f.length; ++i) f[i] = int(random(15));
  }
}

void drawGraphics(color[] pixelArray) {
  for (int i = 0; i < CHIP8_W; ++i) {
    for (int j = 0; j < CHIP8_H; ++j) {
      if (pixelArray[i + j * CHIP8_W] == 0) {
        fill(0);
      } else {
        fill(10, 180, 10);
      }
      rect(i * RECT_SIZE, j * RECT_SIZE, RECT_SIZE, RECT_SIZE);
    }
  }
}

void keyPressed() {
  saveFrame("frames/frame-###.png");
  exit();
}

void keyReleased() {
}


void drawGraphicsTempu(int x, int y, int st, short[] fonts, color[] graphics) {
  for (int h = 0; h < 5; ++h) {
    int pix = fonts[h + st];
    for (int w = 0; w < 8; ++w) {
      int index = (h + y) * CHIP8_W + w + x;
      if ((pix & (0x80 >>> w)) != 0) {
        graphics[index] ^= 1;
      }
    }
  }
}
