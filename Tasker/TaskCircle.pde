float CIRCLE_RADIUS = 400;
class TaskCircle {

  float originX;
  float originY;
  ArrayList<Task> tasks;

  TaskCircle(float originX, float originY) {
    this.originX = originX;
    this.originY = originY;
    tasks = new ArrayList<Task>();
  }

  TaskCircle() {
    this(CIRCLE_RADIUS, height / 2);
  }

  void createTask() {
    tasks.add(new Task(2, 8, "Sleep", color(#ED553B, 220)));
    tasks.add(new Task(9 + tmap(.40), 10 + tmap(.30), "Applied Thermodynamics", color(#20639B, 220)));
    tasks.add(new Task(10 + tmap(.40), 11 + tmap(.30), "Operation Management", color(#3CAEA3, 220)));
    tasks.add(new Task(11 + tmap(.30), 12 + tmap(.20), "Automobile", color(#173F5F, 220)));
    tasks.add(new Task(14 + tmap(.30), 17, "Fluid Lab", color(#584848, 220)));
    tasks.add(new Task(20, 21, "Dining/Tea Break", color(#393B45, 220)));
  }

  float tmap(float t) {
    return map(t, 0, .60, 0, 1);
  }

  void circle() {
    push();
    translate(originX, originY);
    fill(220);
    noStroke();
    arc(0, 0, CIRCLE_RADIUS * 2, CIRCLE_RADIUS * 2, 0, PI);
    fill(200);
    arc(0, 0, CIRCLE_RADIUS * 2, CIRCLE_RADIUS * 2, PI, TWO_PI);
    pop();
  }

  void drawHours() {
    push();
    translate(originX, originY);
    float r = CIRCLE_RADIUS - 20;

    int h = 0;
    for (int i = -90; i < 270; ++i) {
      float x2 = (r - 20) * cos(radians(i));
      float y2 = (r - 20) * sin(radians(i));
      if (i % 15 == 0) {
        fill(0);
        textAlign(CENTER, CENTER);
        textSize(20);
        text(str(h), x2, y2);
        h += 1;
      }
    }
    pop();
  }

  void drawTimeArcUtil(float start, float end, color clr) {
    push();
    translate(originX, originY);
    fill(clr);
    arc(0, 0, CIRCLE_RADIUS * 2, CIRCLE_RADIUS * 2, start, end);
    pop();
  }
  void drawTimeArc(float start, float end, color clr) {
    float startAngle = radians(-90 + 15 * start);
    float endAngle = radians(-90 + 15 * end);
    drawTimeArcUtil(startAngle, endAngle, clr);
  }

  void showTasks() {
    float y = 30;
    for (Task t : tasks) {
      t.show(CIRCLE_RADIUS * 2 + 50, y);
      drawTimeArc(t.startTime, t.endTime, t.clr);
      y += 40;
    }
  }
}
