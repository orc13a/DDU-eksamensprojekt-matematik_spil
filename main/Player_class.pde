class Player extends Component {
  Level level;
  
  float heading = 0;
  PVector v;
  float angle = 0.15;
  float rotation = 0;
  float hitboxSize = 50;
  float fuel = 100;
  float fuelCap = 100;
  
  boolean isBoosting = false;
  boolean isShooting = false;
  boolean displayMirrorPlayer = false;
  boolean isStoped = false;
  
  ArrayList<Bullet> allBullets = new ArrayList<Bullet>();
  
  int bullets = 100;
  int bulletsCap = 100;
  int points = 0;
  int hp = 3;

  Player() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    image = loadImage("player.png");
  }

  void display() {
    fill(255);
    
    for (Bullet b : allBullets) {
      b.display();
    }
    
    pushMatrix();
    stroke(0);
    strokeWeight(1);
    translate(pos.x, pos.y);
    rotate(heading + PI / 2);
    //rect(0, 0, hitboxSize, hitboxSize);
    //line(0, 0, 0, -10);
    image(image, 0, 0, hitboxSize, hitboxSize);
    popMatrix();
  }

  void update() {
    turn();

    if (isBoosting == true) {
      throttle();
    }
    
    if (fuel <= 0) {
      isBoosting = false;
    }
    
    if (isShooting == true && bullets > 0) {
      if (frameCount % 5 == 0) {
        Bullet b = new Bullet(pos, heading);
        allBullets.add(b);
        bullets--;
      }
    }

    if (isStoped == false) {
      pos.add(vel);
      vel.mult(0.99);
    }

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
    if (pos.x >= width + hitboxSize) {
      pos.x = -hitboxSize;
    } else if (pos.x <= -hitboxSize) {
      pos.x = width + hitboxSize;
    }
    
    if (pos.y >= height - hitboxSize/2) {
      pos.y = height - hitboxSize/2;
    } else if (pos.y <= hitboxSize/2) {
      pos.y = hitboxSize/2;
    }
  }

  void throttle() {    
    PVector force = new PVector().fromAngle(heading);
    
    if (isStoped == true) {
      isStoped = false;
    }
    
    force.mult(0.1);
    vel.add(force);
    
    fuel -= 0.15;
  }

  void throttling(boolean b) {
    if (fuel > 0) {
      isBoosting = b;
    }
  }

  void turn() {
    heading += rotation;
  }

  void setRotation(float a) {
    rotation = a;
  }

  void controlsReleased() {
    if (key == 'a' || keyCode == LEFT) {
      setRotation(0);
    }
    
    if (key == 'd' || keyCode == RIGHT) {
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
