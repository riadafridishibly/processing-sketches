class Block {
  float x, y;
  float mass;
  float velocity;
  float w, h;
  
  float xConstrain;

  Block(float x, float y, float mass, float velocity, float w, float h) {
    this.x = x;
    this.y = y;
    this.mass = mass;
    this.velocity = velocity;
    this.w = w;
    this.h = h;
  }

  void setConstrain(float x) {
    xConstrain = x;
  }


  void update() {
    this.x += velocity;
  }


  boolean hitWall() {
    if (this.x <= 10)
      return true;
    return false;
  }

  float bounce(Block b) {
    float sumM = this.mass + b.mass;
    float dx2 = ((this.mass - b.mass) / sumM) * this.velocity +
      ((2 * b.mass /  sumM)) * b.velocity;
    return dx2;
  }


  boolean collide(Block b) {

    float leftA = this.x;
    float rightA = this.x + this.w;
    float topA = this.y;
    float bottomA = this.y + this.w;

    float leftB = b.x;
    float rightB = b.x + b.w;
    float topB = b.y;
    float bottomB = b.y + b.w;

    return !(rightA < leftB  || leftA > rightB || bottomA < topB || topA > bottomB);
  }



  void show() {
    fill(0);
    rect(constrain(x, xConstrain, width), y, w, h);
  }
}
