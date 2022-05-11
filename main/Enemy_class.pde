class Enemy extends Component {
  Player player;

  float heading = 0;
  float hitboxSize = 20;
  float angle = 0;
  float targetAngle = 0;

  PVector targetSaved = new PVector(0, 0);

  ArrayList<Bullet> allBullets = new ArrayList<Bullet>();
  
  boolean isDisplayed = true;

  Enemy(Player p) {
    player = p;

    pos = new PVector(random(50, width-50), random(-100, -150));
    vel = new PVector(0, 0);
  }

  void display() {
    if (isDisplayed == true) {
      pushMatrix();
      stroke(255);
      strokeWeight(1);
      translate(pos.x, pos.y);
      rotate(targetAngle + radians(90));
      fill(0);
      rect(0, 0, hitboxSize, hitboxSize);
      line(0, 0, 0, -10);
      popMatrix();
    }

    for (Bullet b : allBullets) {
      if (b.isDisplayed == true) {
        b.display();
      }
    }
  }

  void update() {
    if (isDisplayed == true) {
      direction();
      movement(targetSaved);
      turn();
      shoot();
      playerHitEnemy();
  
      for (Bullet b : allBullets) {
        if (b.isDisplayed == true) {
          b.update();
        }
        
        if (b.bulletHitPlayer() == true) {
          b.isDisplayed = false;
          player.hp--;
        }
      }
    }
  }

  void direction() {
    PVector p = new PVector(player.pos.x, player.pos.y);
    p.sub(pos);
    p.normalize();
    targetSaved = p;
    targetAngle = p.heading();
  }

  void movement(PVector target) {
    this.pos.x += target.x * 0.6;
    this.pos.y += target.y * 0.6;
  }

  void turn() {
    if (angle > targetAngle) {
      angle -= radians(0.6);
    }
    if (angle < targetAngle) {
      angle += radians(0.6);
    }
  }

  void shoot() {
    if (pos.x >= 0 && pos.x <= width && pos.y >= 20 && pos.y <= height) {
      if (frameCount % 50 == 0) {
        Bullet b = new Bullet(pos, targetAngle, player);
        allBullets.add(b);
      }
    }
  }
  
  void playerHitEnemy() {
    if (isDisplayed == true) {
      for (Bullet b : player.allBullets) {
        float dist = dist(b.pos.x, b.pos.y, pos.x, pos.y);
        
        if (dist < hitboxSize/2) {
          isDisplayed = false;
          b.isDisplayed = false;
          player.points += 100;
        }
      }
    }
  }
}
