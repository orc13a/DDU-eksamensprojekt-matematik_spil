class Asteriodgame {
  PApplet PObject;

  Player player;
  Level level;

  int tabelSelected = 0;
  int savedScore = 0;

  boolean runGame = false;
  boolean showStartScreen = true;
  boolean showGameOverScreen = false;
  boolean showLeaderBoardScreen = false;
  boolean showSelectMuliTableScreen = false;

  Button startBtn;
  Button saveScoreBtn;
  Button exitBtn;
  Button playAgainBtn;
  Button leaderBoardBtn;

  Input saveScoreInput;

  ArrayList<Button> allMultiTabelButtons = new ArrayList<Button>();
  ArrayList<LeaderboardUser> allLeaderboardUsers = new ArrayList<LeaderboardUser>();

  Asteriodgame(PApplet PObj) {
    PObject = PObj;

    surface.setTitle("Matematik spil");
    frameRate(60);

    imageMode(CENTER);
    rectMode(CENTER);
    player = new Player();
    //level = new Level(player, 0);

    startBtn = new Button("Start", width/2, height/2, 100, 40);
    saveScoreBtn = new Button("Gem", width/2, height/2 + 75, 100, 40);
    exitBtn = new Button("Afslut", width/4, height - 100, 100, 40);
    playAgainBtn = new Button("Spil igen", width/4 * 2, height - 100, 100, 40);
    leaderBoardBtn = new Button("Leaderboard", width/4 * 3, height - 100, 150, 40);

    for (int i = 1; i <= 5; i++) {
      Button b = new Button(str(i), 0 + (i * 100), (height/2) - 50, 50, 50);
      b.tabelValue = i;
      b.setHidden(false);
      allMultiTabelButtons.add(b);
    }

    for (int i = 6; i <= 10; i++) {
      Button b = new Button(str(i), 0 + ((i - 5) * 100), (height/2) + 50, 50, 50);
      b.tabelValue = i;
      b.setHidden(false);
      allMultiTabelButtons.add(b);
    }

    saveScoreInput = new Input(width/2, height/2, 200, 40, 6);
  }

  void run() {
    display();
    update();
  }

  void display() {
    clear();
    background(255);

    if (showStartScreen == true && runGame == false && showGameOverScreen == false) {
      startScreen();
    }

    if (showSelectMuliTableScreen == true && showStartScreen == false && runGame == false) {
      for (Button b : allMultiTabelButtons) {
        b.setHidden(false);
      }

      selectMuliTableScreen();
    }

    if (runGame == true && showStartScreen == false && showGameOverScreen == false) {
      level.display();
      ui();
    }

    if (showGameOverScreen == true && runGame == false) {
      gameOverScreen();
    }

    if (showLeaderBoardScreen == true && showGameOverScreen == false && runGame == false) {
      leaderBoardScreen();
    }
  }

  void update() {
    if (runGame == true && showStartScreen == false && showGameOverScreen == false) {
      level.update();
    }

    if (showStartScreen == true && startBtn.clicked() == true) {
      showStartScreen = false;
      startBtn.setHidden(true);
      showSelectMuliTableScreen = true;
    }

    if (showSelectMuliTableScreen == true && showStartScreen == false && runGame == false) {
      for (Button b : allMultiTabelButtons) {
        if (b.clicked() == true && b.tabelValue != 0) {
          tabelSelected = b.tabelValue;

          level = new Level(player, tabelSelected);
          showSelectMuliTableScreen = false;
          runGame = true;

          for (Button bb : allMultiTabelButtons) {
            bb.setHidden(true);
          }
        }
      }
    }

    if (player.hp <= 0 || player.fuel <= 0) {
      runGame = false;
      showGameOverScreen = true;
      savedScore = player.points;
    }

    if (showGameOverScreen == true || showLeaderBoardScreen == true && runGame == false) {
      if (saveScoreInput.clicked() == true && saveScoreInput.isActive == false) {
        saveScoreInput.setActive(true);
      }

      if (mousePressed && saveScoreInput.clicked() == false && saveScoreInput.isActive == true) {
        saveScoreInput.setActive(false);
      }

      if (exitBtn.clicked() == true) {
        exit();
      }

      if (playAgainBtn.clicked() == true) {
        player = new Player();

        showGameOverScreen = false;
        showLeaderBoardScreen = false;

        saveScoreBtn.setHidden(true);
        exitBtn.setHidden(true);
        playAgainBtn.setHidden(true);
        leaderBoardBtn.setHidden(true);
        saveScoreInput.setHidden(true);

        showSelectMuliTableScreen = true;
      }

      if (leaderBoardBtn.clicked() == true) {
        player = new Player();

        showGameOverScreen = false;

        saveScoreBtn.setHidden(true);
        exitBtn.setHidden(true);
        playAgainBtn.setHidden(true);
        leaderBoardBtn.setHidden(true);
        saveScoreInput.setHidden(true);

        showLeaderBoardScreen = true;
      }

      if (saveScoreBtn.clicked() == true && saveScoreInput.userInput.length() > 0) {
        try {
          SQLite db = new SQLite(PObject, "database.sqlite");

          if (db.connect()) {
            db.query("INSERT INTO leaderboard VALUES (null, \"" + saveScoreInput.userInput + "\", " + savedScore + ");");
            db.close();

            player = new Player();

            showGameOverScreen = false;

            saveScoreBtn.setHidden(true);
            exitBtn.setHidden(true);
            playAgainBtn.setHidden(true);
            leaderBoardBtn.setHidden(true);
            saveScoreInput.setHidden(true);

            showLeaderBoardScreen = true;
          }
        } 
        catch(Exception e) {
          println(e);
        }
      }
    }
  }

  void startScreen() {
    startBtn.setHidden(false);

    fill(0);
    textSize(40);
    textAlign(CENTER);
    text("Matematik spil", width/2, 100);
    textSize(12);
    textAlign(LEFT);

    startBtn.display();

    //startBtn.setHidden(true);
  }

  void selectMuliTableScreen() {
    fill(0);
    textSize(40);
    textAlign(CENTER);
    text("Matematik spil", width/2, 100);
    textSize(20);
    text("Vælg tabel du vil øve", width/2, 150);
    textSize(12);
    textAlign(LEFT);

    for (Button b : allMultiTabelButtons) {
      b.display();
    }
  }

  void gameOverScreen() {
    saveScoreBtn.setHidden(false);
    exitBtn.setHidden(false);
    playAgainBtn.setHidden(false);
    leaderBoardBtn.setHidden(false);

    saveScoreInput.setHidden(false);

    fill(0);
    textSize(40);
    textAlign(CENTER);
    text("GAME OVER", width/2, 100);
    textSize(20);

    if (player.hp <= 0) {
      text("Du har ikke flere liv", width/2, 150);
    }

    if (player.fuel <= 0) {
      text("Du har ikke mere brandstof", width/2, 200);
    }

    text("Point: " + player.points, width/2, 250);

    textSize(16);
    text("Skriv dine intentialer", width/2, height/2 - 75);
    textAlign(LEFT);

    saveScoreInput.display();
    saveScoreBtn.display();

    textSize(12);

    exitBtn.display();
    playAgainBtn.display();
    leaderBoardBtn.display();
  }

  void leaderBoardScreen() {
    exitBtn.setHidden(false);
    playAgainBtn.setHidden(false);

    fill(0);
    textSize(40);
    textAlign(CENTER);
    text("Leaderboard", width/2, 100);

    textSize(12);
    textAlign(LEFT);

    if (allLeaderboardUsers.size() == 0) {
      updateLeaderboard();
      
      for (int i = 0; i < allLeaderboardUsers.size(); i++) {
        LeaderboardUser user = allLeaderboardUsers.get(i);
        user.y = 250 + (i * 40);
      }
    } else {
      textAlign(CENTER);
      textSize(26);
      text("Intentialer", width/3, 200);
      text("Point", width/3 * 2, 200);
      textSize(12);
      textAlign(LEFT);
      
      for (LeaderboardUser u : allLeaderboardUsers) {
        u.display();
      }
    }

    exitBtn.display();
    playAgainBtn.display();
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
  
  void updateLeaderboard() {
    try {
      SQLite db = new SQLite(PObject, "database.sqlite");
      
      if (db.connect()) {
        db.query("SELECT * FROM leaderboard ORDER BY score DESC;"); // DESC = descending
        
        while (db.next()) {
          LeaderboardUser user = new LeaderboardUser(0, 0);
          
          int id = db.getInt("id");
          String username = db.getString("username");
          int score = db.getInt("score");
          
          user.setUser(id, username, score);
          
          allLeaderboardUsers.add(user);
        }
        
        db.close();
      }
    } catch(Exception e) {
      println(e);
    }
  }

  void controls() {
    if (runGame == true && showStartScreen == false && level.isLevelPaused == false) {
      player.controls();
    }

    if (showGameOverScreen == true && runGame == false) {
      saveScoreInput.update();
    }
  }

  void controlsReleased() {
    if (runGame == true && showStartScreen == false && level.isLevelPaused == false) {
      player.controlsReleased();
    }
  }
}
