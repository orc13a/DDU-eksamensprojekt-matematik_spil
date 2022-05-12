import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

Asteriodgame game;

void setup() {
  size(600, 800);
  smooth(8);
  game = new Asteriodgame(this);
}

void draw() {
  game.run();
}

void keyReleased() {
  game.controlsReleased();
}

void keyPressed() {
  game.controls();
}
