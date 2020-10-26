ME me;
float x, y;
void setup() {
  size(1000, 1000);
  //fullScreen();
  //me = new ME(height / 2, 20, color(240, 120, 24));
  me = new ME(height * 0.4, 45);
  x = (width - me.getWidth()) / 2;
  y = (height - me.getHeight()) / 2;
}


void draw() {
  background(252, 235, 182);
  me.draw(x, y);
}


class ME {
  float ch, cw, spacing;
  float eLargeShrink = 0.72;
  float eSmallShrink = 0.4;
  float mMiddleShrink = 0.5;
  color clr;
  
  ME(float ch, float spacing, color clr) {
    this.ch = ch;
    this.spacing = spacing;
    this.cw = (ch - 2 * spacing) / 3;
    this.clr = clr;
  }

  ME(float ch, float spacing) {
    this(ch, spacing, color(0));
  }
  
  ME() {
    this(height * 0.6, height * 0.05);
  }

  float getWidth() {
    return spacing * 3 + cw * 3 + ch * eLargeShrink;
  }

  float getHeight() {
    return ch;
  }
  void draw() {
    draw(0, 0);
  }
  void draw(float x, float y) {
    noStroke();
    fill(clr);

    pushMatrix();

    // M first part
    translate(x, y);
    rect(0, 0, cw, ch);
    // M second part
    translate(cw + spacing, 0);
    rect(0, 0, cw, ch * mMiddleShrink);
    // M third part
    translate(cw + spacing, 0);
    rect(0, 0, cw, ch);

    //translate(cw + spacing, 0);
    //rect(0, 0, cw, ch);

    translate(cw + spacing, 0);
    rect(0, 0, ch * eLargeShrink, cw);

    translate(0, cw + spacing);
    rect(0, 0, ch * eSmallShrink, cw);

    translate(0, cw + spacing);
    rect(0, 0, ch * eLargeShrink, cw);
    
    popMatrix();
  }
}
