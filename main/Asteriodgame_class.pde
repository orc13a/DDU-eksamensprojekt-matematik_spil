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
  }
  
  void update() {
    player.update();
  }
  
  void controls() {
    player.controls();
  }
}
