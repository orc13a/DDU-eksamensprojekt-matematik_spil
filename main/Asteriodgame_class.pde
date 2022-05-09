class Asteriodgame {
  Player player;
  Level level;
  
  Asteriodgame() {
    surface.setTitle("Matematik spil");
    frameRate(60);
    
    imageMode(CENTER);
    rectMode(CENTER);
    player = new Player();
    level = new Level(player);
  }
  
  void run() {
    display();
    update();
  }
  
  void display() {
    clear();
    background(255);
    
    level.display();
    player.display();
    ui();
    
    btn.display();
  }
  
  void update() {
    player.update();
    level.update();
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
