
// I'll refactor this later.

PVector intersectPoint(Line l1, Line l2) {
  float m1 = -l1.m;
  float m2 = -l2.m;

  float den = m1 - m2;
  
  if (den == 0) {
    float xx = l1.vertical ? l1.x : l2.x;
    float yy = l1.vertical ? l2.b : l1.b;
    return new PVector(xx, yy);
  }

  float x = (l1.b - l2.b) / den;
  float y = (m1 * l2.b - m2 * l1.b) / den;

  return new PVector(x, y);
}


class Line {
  float m; // slope
  float b; // y intercept
  float x;
  boolean vertical = false;

  Line (float x1, float y1, float x2, float y2) {
    float num = y2 - y1;
    float den = x2 - x1;

    if (den == 0) {
      // line vertical
      vertical = true;
      x = x1;
      m = 0;
      println("Vertical Line");
    } else {
      m = num / den;
    }

    b = y1 - (m * x1);
  }

  Line (PVector p1, PVector p2) {
    this(p1.x, p1.y, p2.x, p2.y);
  }

  Line (float m_, float b_) {
    m = m_;
    b = b_;
  }
  
  Line(float xintercept) {
    vertical = true;
    x = xintercept;
  }


  Line perpendicularLineAt(float x, float y) {
    if (vertical) {
      return new Line(0, y);
    }
    
    // line horizontal
    if (m == 0) {
      return new Line(x);
    }
    float newSlope = -1.0 / m;
    float newB = y - newSlope * x;

    return new Line(newSlope, newB);
  }


  void show(float x1, float x2) {
    if (vertical) {
      push();
      stroke(0);
      line(x, 0, x, height);
      pop();
      return;
    }
    float y1 = m * x1 + b;
    float y2 = m * x2 + b;

    // println(y1, y2);
    push();
    stroke(0);
    line(x1, y1, x2, y2);
    pop();
  }

  void show() {
    show(0, width);
  }
}
