class Task {
  float startTime;
  float endTime;
  String label;
  String comment;
  color clr;

  Task(float st, float end, String label, color clr) {
    this.startTime = st;
    this.endTime = end;
    this.label = label;
    this.clr = clr;
  }

  void show(float x, float y) {
    push();
    translate(x, y);
    stroke(0);
    fill(clr);
    rect(0, 0, 30, 30);
    textSize(30);
    textAlign(LEFT, TOP);
    fill(0);
    text(label, 40, 0);
    pop();
  }
}
