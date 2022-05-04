class Asteriodgame {
  Player player;
  
  Asteriodgame() {
    surface.setTitle("Matematik spil");
    frameRate(60);
    
    rectMode(CENTER);
    player = new Player();
  }
  
  void run() {
    display();
    update();
  }
  
  void display() {
    clear();
    background(255);
    
    player.display();
    ui();
  }
  
  void update() {
    player.update();
  }
  
  void ui() {
    // Brandstof
    fill(0);
    text("Brandstof: ", 25, height - 25);
    rectMode(CORNER);
    noFill();
    stroke(0);
    strokeWeight(1);
    rect(90, height - 40, 100, 20);
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
