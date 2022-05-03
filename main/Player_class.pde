class Player extends Component {
  float heading = 0;
  PVector v;
  float angle = 0.15;
  float rotation = 0;
  boolean isBoosting = false;

  Player() {
    pos = new PVector(width/2, height/2);

    vel = new PVector(0, 0);
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(heading + PI / 2);
    rect(0, 0, 20, 20);
    line(0, 0, 0, -10);
    popMatrix();
  }

  void update() {
    //controls();
    turn();
    if (isBoosting == true) {
      throttle();
    }
    
    pos.add(vel);
    vel.mult(0.99);
  }

  void throttle() {
    PVector force = new PVector().fromAngle(heading);
    force.mult(0.1);
    vel.add(force);
  }
  
  void throttling(boolean b) {
    isBoosting = b;
  }

  void turn() {
    heading += rotation;
  }
  
  void setRotation(float a) {
    rotation = a;
  }
  
  void controlsReleased() {
    if (key == 'a' || keyCode == LEFT || key == 'd' || keyCode == RIGHT) {
      setRotation(0);
    }
    
    if (key == 'w' || keyCode == UP) {
      throttling(false);
    }
  }

  void controls() {
    //if (keyPressed) {
      if (key == ' ') {
        
      } else if (key == 'a' || keyCode == LEFT) {
        setRotation(-0.1);
      } else if (key == 'd' || keyCode == RIGHT) {
        setRotation(0.1);
      } else if (key == 'w' || keyCode == UP) {
        throttling(true);
      }
    //}
  }
}
