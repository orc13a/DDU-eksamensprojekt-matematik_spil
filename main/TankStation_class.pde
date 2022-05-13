class TankStation extends Component {
  Player player;
  Level level;

  float fuel = random(20, 60);
  boolean hasGivenFuel = false; 
  
  MathPopup question;

  TankStation(PVector pos_, Player p, Level l) {
    pos = new PVector(pos_.x, pos_.y);
    w = 60;
    h = 60;
    player = p;
    level = l;
    
    image = loadImage("fuelIcon.png");
    
    question = new MathPopup(level);
  }

  void display () {
    if (hasGivenFuel == false) {
      pushMatrix();
      translate(pos.x, pos.y);
      //fill(0);
      //rect(0, 0, w, h);
      image(image, 0, 0, w, h);
      popMatrix();
    }
  }
  
  void update() {
    pos.add(vel);
  }
  
  void setMove(PVector spd) {
    vel.add(spd);
  }

  void giveFuel() {
    float playerMissingFuel = player.fuelCap - player.fuel;

    if (hasGivenFuel == false) {
      if (playerMissingFuel > fuel) {
        player.fuel += fuel;
        hasGivenFuel = true;
      } else if (playerMissingFuel <= fuel) {
        player.fuel += playerMissingFuel;
        hasGivenFuel = true;
      }
    }
  }
  
  boolean playerAtStation() {
    if (player.pos.x >= pos.x - w/2 && player.pos.x <= pos.x + w/2 && player.pos.y >= (pos.y - h/2) && player.pos.y <= (pos.y + h/2)) {
      return true;
    } else {
      return false;
    }
  }
}
