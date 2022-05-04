class Player extends Component {
  float heading = 0;
  PVector v;
  float angle = 0.15;
  float rotation = 0;
  boolean isBoosting = false;
  boolean isShooting = false;
  
  float hitboxSize = 20;
  
  ArrayList<Bullet> allBullets = new ArrayList<Bullet>();

  Player() {
    pos = new PVector(width/2, height/2);

    vel = new PVector(0, 0);
  }

  void display() {
    pushMatrix();
    stroke(0);
    strokeWeight(1);
    translate(pos.x, pos.y);
    rotate(heading + PI / 2);
    rect(0, 0, hitboxSize, hitboxSize);
    line(0, 0, 0, -10);
    popMatrix();

    edgeCheck();
    
    for (Bullet b : allBullets) {
      b.display();
    }
  }

  void update() {
    turn();

    if (isBoosting == true) {
      throttle();
    }
    
    if (isShooting == true) {
      if (frameCount % 5 == 0) {
        Bullet b = new Bullet(pos, heading);
        allBullets.add(b);
      }
    }

    pos.add(vel);
    vel.mult(0.99);

    edgeCheck();
    
    for (Bullet b : allBullets) {
      b.update();
    }
  }

  void edgePlayer(float x_, float y_, boolean display) {
    if (display == true) {
      pushMatrix();
      translate(x_, y_);
      rotate(heading + PI / 2);
      rect(0, 0, 20, 20);
      line(0, 0, 0, -10);
      popMatrix();
    }
  }

  void edgeCheck() {
    if (this.pos.x > width + hitboxSize) {
      this.pos.x = -hitboxSize;
    } else if (this.pos.x < -hitboxSize) {
      this.pos.x = width + hitboxSize;
    }
    if (this.pos.y > height + hitboxSize) {
      this.pos.y = -hitboxSize;
    } else if (this.pos.y < -hitboxSize) {
      this.pos.y = height + hitboxSize;
    }

    //if (this.pos.x >= width - 10) {
    //  edgePlayer(pos.x - width, pos.y, true);
    //} else if (this.pos.x <= 10) {
    //  edgePlayer(pos.x + width, pos.y, true);
    //} else {
    //  edgePlayer(0, 0, false);
    //}

    //if (this.pos.y >= height - 10) {
    //  edgePlayer(pos.x, pos.y - height, true);
    //} else if (this.pos.y <= 10) {
    //  edgePlayer(pos.x, pos.y + height, true);
    //} else {
    //  edgePlayer(0, 0, false);
    //}
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
    
    if (key == ' ') {
      isShooting = false;
    }
  }

  void controls() {
    if (key == ' ') {
      isShooting = true;
    } else if (key == 'a' || keyCode == LEFT) {
      setRotation(-0.1);
    } else if (key == 'd' || keyCode == RIGHT) {
      setRotation(0.1);
    } else if (key == 'w' || keyCode == UP) {
      throttling(true);
    }
  }
}
