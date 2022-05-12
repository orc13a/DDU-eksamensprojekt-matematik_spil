class LeaderboardUser extends Component {
  int id = 0;
  int score = 0;
  
  boolean showWidthId = false;
  
  String username = "";

  LeaderboardUser(float x_, float y_) {
    x = x_;
    y = y_;
  }

  void setUser(int id_, String username_, int score_) {
    id = id_;
    username = username_;
    score = score_;
  }

  void display() {
    textAlign(CENTER);
    fill(0);
    textSize(20);
    if (showWidthId == true) {
      text(id, width/4, y);
      text(username, width/4 * 2, y);
      text(score, width/4 * 3, y);
    } else {
      text(username, width/3, y);
      text(score, width/3 * 2, y);
    }
    textSize(12);
    textAlign(LEFT);
  }
}
