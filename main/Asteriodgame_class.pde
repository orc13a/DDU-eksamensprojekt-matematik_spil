class Asteriodgame {
  Player player;
  ArrayList<TankStation> allTankStation = new ArrayList<TankStation>();
  
  Asteriodgame() {
    surface.setTitle("Matematik spil");
    frameRate(60);
    
    rectMode(CENTER);
    player = new Player();
    
    allTankStation.add(new TankStation(new PVector(100, 100), player));
  }
  
  void run() {
    display();
    update();
  }
  
  void display() {
    clear();
    background(255);
    
    for (TankStation t : allTankStation) {
      t.display();
    }
    
    player.display();
    ui();
  }
  
  void update() {
    player.update();
    
    for (TankStation t : allTankStation) {
      if (t.playerAtStation() == true) {
        t.giveFuel();
      }
    }
    
    for (TankStation t : allTankStation) {
      if (t.hasGivenFuel == true) {
        //allTankStation.remove(t);
      }
    }
  }
  
  void ui() {
    // Brandstof
    fill(0);
    text("Brandstof: ", 25, height - 25);
    rectMode(CORNER);
    noFill();
    stroke(0);
    strokeWeight(1);
    rect(90, height - 40, player.fuelCap, 20);
    fill(0);
    rect(90, height - 40, player.fuel, 20);
    rectMode(CENTER);
    
    // Liv
    text("Liv: ", 400, height - 25);
    for (int i = 1; i <= player.hp; i++) {
      rect(425 + (15 * i), height - 30, 10, 10);
    }
  }
  
  void controls() {
    player.controls();
  }
}
