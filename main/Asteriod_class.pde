class Asteriod extends Component {
  float size;

  Player player;

  boolean destroyed = false;
  boolean givenDamage = false;

  Asteriod(Player p) {
    player = p;

    image = loadImage("asteriod_1.png");
    size = random(50, 100);

    float ranX = random(0, width);
    float ranY = random(-100, (0 - size));

    pos = new PVector(ranX, ranY);
  }

  void display() {
    if (destroyed == false) {
      image(image, pos.x, pos.y, size, size);
    }
  }

  void update() {
    pos.add(vel);
    playerCollision();
    bulletCollision();
  }

  void setMove(PVector spd) {
    vel.add(spd);
  }

  void playerCollision() {
    float dist = dist(pos.x, pos.y, player.pos.x, player.pos.y);

    if (dist < (size/2) + (player.hitboxSize/2) && givenDamage == false) {
      player.hp -= 1;
      givenDamage = true;
    }
    
    if (dist > (size/2) + (player.hitboxSize/2) && givenDamage == true) {
      givenDamage = false;
    }
  }

  void bulletCollision() {
    for (Bullet b : player.allBullets) {
      float dist = dist(pos.x, pos.y, b.pos.x, b.pos.y);

      if (dist < size/2) {
        destroyed = true;
      }
    }
  }
}
