class Asteriodgame {
  Player player;
  ArrayList<TankStation> allTankStations = new ArrayList<TankStation>();
  ArrayList<Asteriod> allAsteriods = new ArrayList<Asteriod>();
  
  Asteriodgame() {
    surface.setTitle("Matematik spil");
    frameRate(60);
    
    imageMode(CENTER);
    rectMode(CENTER);
    player = new Player();
    
    TankStation t = new TankStation(new PVector(random(50, width-50), random(50, height-50)), player);
    t.setMove(new PVector(0, 1));
    allTankStations.add(t);
    
    Asteriod a = new Asteriod();
    a.setMove(new PVector(0, 1));
    allAsteriods.add(a);
  }
  
  void run() {
    display();
    update();
  }
  
  void display() {
    clear();
    background(255);
    
    for (TankStation t : allTankStations) {
      t.display();
    }
    
    player.display();
    
    for (Asteriod a : allAsteriods) {
      a.display();
    }
    
    ui();
  }
  
  void update() {
    player.update();
    
    for (TankStation t : allTankStations) {
      t.update();
      
      if (t.playerAtStation() == true) {
        t.giveFuel();
      }
    }
    
    for (Asteriod a : allAsteriods) {
      a.update();
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
    
    // Skud
    text("Skud: " + player.bullets + " / " + player.bulletsCap, 230, height - 25);
    
    text("Point: 0", 390, height - 25);
    
    // Liv
    text("Liv: ", 500, height - 25);
    for (int i = 1; i <= player.hp; i++) {
      rect(525 + (15 * i), height - 30, 10, 10);
    }
  }
  
  void controls() {
    player.controls();
  }
}
