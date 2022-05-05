class TankStation extends Component {
  Player player;

  float fuel = 20;
  boolean hasGivenFuel = false; 

  TankStation(PVector pos_, Player p) {
    pos = new PVector(pos_.x, pos_.y);
    w = 60;
    h = 60;
    player = p;
  }

  void display () {
    println(playerAtStation());
    if (hasGivenFuel == false) {
      pushMatrix();
      translate(pos.x, pos.y);
      rect(0, 0, w, h);
      popMatrix();
    }
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
    println(player.pos);
    println(pos);
    println('-');
    if (player.pos.x >= pos.x - w/2 && player.pos.x <= pos.x + w/2 && player.pos.y >= (pos.y - h/2) && player.pos.y <= (pos.y + h/2)) {
      return true;
    } else {
      return false;
    }
  }
}
