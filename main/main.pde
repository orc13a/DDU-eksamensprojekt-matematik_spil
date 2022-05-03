Asteriodgame game;

void setup() {
  size(600, 800);
  smooth(8);
  game = new Asteriodgame();
}

void draw() {
  game.run();
}

void keyReleased() {
  game.player.controlsReleased();
}

void keyPressed() {
  game.controls();
}
