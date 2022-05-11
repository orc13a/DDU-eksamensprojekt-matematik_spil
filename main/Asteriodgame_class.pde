class Asteriodgame {
  Player player;
  Level level;
  
  int tabel = 2;
  
  MathPopup m;
  
  Asteriodgame() {
    surface.setTitle("Matematik spil");
    frameRate(60);
    
    imageMode(CENTER);
    rectMode(CENTER);
    player = new Player();
    level = new Level(player, tabel);
    
    //m = new MathPopup("Hvad er 2 ⋅ 2?", 4, tabel, level);
  }
  
  void run() {
    display();
    update();
  }
  
  void display() {
    clear();
    background(255);
    
    level.display();
    //player.display();
    ui();
    
    //m.display();
  }
  
  void update() {
    //player.update();
    level.update();
    //m.update();
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
    //text("Skud: " + player.bullets + " / " + player.bulletsCap, 230, height - 25);
    text("Skud: " + player.bullets, 230, height - 25);
    
    text("Point: " + player.points, 390, height - 25);
    
    // Liv
    text("Liv: ", 500, height - 25);
    for (int i = 1; i <= player.hp; i++) {
      rect(525 + (15 * i), height - 30, 10, 10);
    }
  }
  
  void controls() {
    if (level.isLevelPaused == false) {
      player.controls();
    }
  }
  
  void controlsReleased() {
    if (level.isLevelPaused == false) {
      player.controlsReleased();
    }
  }
}
