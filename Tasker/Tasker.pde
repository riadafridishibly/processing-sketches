
TaskCircle t;

void settings() {
  size(1280, 800);
}

void setup() {
  t = new TaskCircle();
  t.createTask();
  background(255);
  noStroke();
  //fill(0);
  arc(width / 2, height / 2, 400, 400, 0, HALF_PI);
}

void push() {
  pushMatrix();
  pushStyle();
}

void pop() {
  popStyle();
  popMatrix();
}

void draw() {
  background(255);
  t.circle();
  //t.drawTimeArc(2.50, 8.50);
  //t.drawTimeArc(14.5, 17);
  t.showTasks();
  t.drawHours();
  fill(220);
  //drawAnimation();
}

float tt;

void drawAnimation() {
  push();
  translate(CIRCLE_RADIUS, height / 2);
  beginShape();
  float xoff = 0;
  for (int i = 0; i <= 360; ++i) {
    float p = 1.0 * i / 360;
    float r = noise(10 * cos(xoff), 10 * sin(tt)) * CIRCLE_RADIUS / 2;
    float x = r * cos(radians(i));
    float y = r * sin(radians(i));
    
    vertex(x, y);
    xoff += 0.001;
  }
  endShape();
  tt += 0.01;
  pop();
}

void keyPressed() {
  if (key == ' ')
    saveFrame("workload.png");
}
