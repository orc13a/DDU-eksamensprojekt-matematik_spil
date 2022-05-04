class Bullet extends Component {
  
  Bullet(PVector PlayerPos, float PlayerHeading) {
    pos = new PVector(PlayerPos.x, PlayerPos.y);
    vel = PVector.fromAngle(PlayerHeading);
    vel.mult(10);
  }
  
  void update() {
    pos.add(vel);
  }
  
  void display() {
    pushMatrix();
    stroke(0);
    strokeWeight(4);
    point(pos.x, pos.y);
    noStroke();
    popMatrix();
  }
}
