class Asteriod extends Component {
  float size;
  
  Asteriod() {
    image = loadImage("asteriod_1.png");
    size = random(50, 100);
    
    float ranX = random(0, width);
    float ranY = random(-100, (0 - size));
    
    pos = new PVector(ranX, ranY);
  }
  
  void display() {
    image(image, pos.x, pos.y, size, size);
  }
  
  void update() {
    pos.add(vel);
  }
  
  void setMove(PVector spd) {
    vel.add(spd);
  }
}
