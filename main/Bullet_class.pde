class Bullet extends Component {
  Player player;
  
  boolean isEnemyBullet = false;
  boolean isDisplayed = true;
  
  Bullet(PVector PlayerPos, float PlayerHeading) {
    pos = new PVector(PlayerPos.x, PlayerPos.y);
    vel = PVector.fromAngle(PlayerHeading);
    vel.mult(10);
  }
  
  Bullet(PVector PlayerPos, float PlayerHeading, Player p) {
    player = p;
    
    pos = new PVector(PlayerPos.x, PlayerPos.y);
    vel = PVector.fromAngle(PlayerHeading);
    vel.mult(10);
    
    isEnemyBullet = true;
  }
  
  void display() {
    if (isDisplayed == true) {
      pushMatrix();
      stroke(0);
      strokeWeight(4);
      point(pos.x, pos.y);
      noStroke();
      popMatrix();
    }
  }
  
  void update() {
    if (isDisplayed == true) {
      pos.add(vel);
    }
  }
  
  boolean bulletHitPlayer() {
    if (isEnemyBullet == true && isDisplayed == true) {
      float dist = dist(pos.x, pos.y, player.pos.x, player.pos.y);
      
      if (dist <= player.hitboxSize/2) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
