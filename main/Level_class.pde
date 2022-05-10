class Level {
  Player player;
  
  ArrayList<TankStation> allTankStations = new ArrayList<TankStation>();
  ArrayList<Asteriod> allAsteriods = new ArrayList<Asteriod>();
  
  int tabel;
  
  Level(Player p, int tabel_) {
    player = p;
    tabel = tabel_;
    
    //TankStation t = new TankStation(new PVector(random(50, width-50), random(50, height-50)), player);
    //t.setMove(new PVector(0, 1));
    //allTankStations.add(t);
    
    Asteriod a1 = new Asteriod(player, this);
    a1.setMove(new PVector(0, 1));
    allAsteriods.add(a1);
    
    Asteriod a2 = new Asteriod(player, this);
    a2.setMove(new PVector(0, 1));
    allAsteriods.add(a2);
  }
  
  void display() {
    for (TankStation t : allTankStations) {
      t.display();
    }
    
    player.display();
    
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
    
    player.update();
    
    for (Asteriod a : allAsteriods) {
      a.update();
    }
    
    if (frameCount % 360 == 0) {
      TankStation t = new TankStation(new PVector(random(50, width-50), random(0, -100)), player);
      t.setMove(new PVector(0, 1));
      allTankStations.add(t);
    }
    
    if (frameCount % 240 == 0) {
      int addCount = int(random(1, 4));
      
      for (int i = 1; i <= addCount; i++) {
        Asteriod a = new Asteriod(player, this);
        a.setMove(new PVector(0, 1));
        allAsteriods.add(a);
      }
    }
  }
}
