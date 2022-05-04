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
    if (hasGivenFuel == false) {
      rect(pos.x, pos.x, w, h);
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
    if (player.pos.x >= pos.x - w/2 && player.pos.x <= pos.x + w/2 && player.pos.y >= pos.y - h/2 && player.pos.y <= pos.y + h/2) {
      return true;
    } else {
      return false;
    }
  }
}
