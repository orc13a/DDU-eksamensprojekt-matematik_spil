class Level {
  Player player;
  
  ArrayList<TankStation> allTankStations = new ArrayList<TankStation>();
  ArrayList<Asteriod> allAsteriods = new ArrayList<Asteriod>();
  
  Level(Player p) {
    player = p;
    
    TankStation t = new TankStation(new PVector(random(50, width-50), random(50, height-50)), player);
    t.setMove(new PVector(0, 1));
    allTankStations.add(t);
    
    Asteriod a = new Asteriod();
    a.setMove(new PVector(0, 1));
    allAsteriods.add(a);
  }
  
  void display() {
    for (TankStation t : allTankStations) {
      t.display();
    }
    
    for (Asteriod a : allAsteriods) {
      a.display();
    }
  }
  
  void update() {
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
}
