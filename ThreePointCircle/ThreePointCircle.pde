

PVector[] points;

// I'll refactor this later

PVector mid1, mid2, center;

Line[] lines;
Line[] perp;

void setup() {
  size(800, 800);
  points = new PVector[3];
  lines = new Line[2];
  perp = new Line[2];

  //points[0] = new PVector(200, 200);
  //points[1] = new PVector(200, 570);
  //points[2] = new PVector(650, 570);
}

int index = 0;

void draw() {
  background(255);



  stroke(0);

  for (PVector p : points) {
    fill(0);
    if (p != null)
      circle(p.x, p.y, 10);
  }

  for (Line l : lines) {
    if (l != null)
      l.show();
  }

  fill(255, 0, 0);
  if (mid1 != null)
    circle(mid1.x, mid1.y, 10);
  if (mid2 != null)
    circle(mid2.x, mid2.y, 10);
  if (center != null)
    circle(center.x, center.y, 15);

  for (Line l : perp) {
    if (l != null)
      l.show();
  }

  noFill();
  if (points[0] != null && center != null)
    circle(center.x, center.y, dist(center.x, center.y, points[0].x, points[0].y) * 2);
}


PVector midPoint(PVector p1, PVector p2) {
  float x = lerp(p1.x, p2.x, 0.5);
  float y = lerp(p1.y, p2.y, 0.5);
  return new PVector(x, y);
}



void mousePressed() {
  switch(index) {
  case 0:
    points[0] = new PVector(mouseX, mouseY);
    println("Zero");
    index++;
    break;
  
  case 1:
    points[1] = new PVector(mouseX, mouseY);
    mid1 = midPoint(points[0], points[1]);
    lines[0] = new Line(points[0], points[1]);
    perp[0] = lines[0].perpendicularLineAt(mid1.x, mid1.y);
    index++;
    break;

  case 2:
    points[2] = new PVector(mouseX, mouseY);
    mid2 = midPoint(points[1], points[2]);
    lines[1] = new Line(points[1], points[2]);
    perp[1] = lines[1].perpendicularLineAt(mid2.x, mid2.y);
    center = intersectPoint(perp[0], perp[1]);
    index++;
    break;

  case 3:
    index = 0;
    points[0] = null;
    points[1] = null;
    points[2] = null;
    mid1 = null;
    mid2 = null;
    lines[0] = null;
    lines[1] = null;
    perp[0] = null;
    perp[1] = null;
    center = null;

    break;
  }
}
