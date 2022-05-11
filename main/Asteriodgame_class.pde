class Asteriodgame {
  Player player;
  Level level;

  int tabelSelected = 0;

  boolean runGame = false;
  boolean showStartScreen = true;
  boolean showGameOverScreen = false;
  boolean showLeaderBoardScreen = false;
  boolean showSelectMuliTableScreen = false;

  Button startBtn;
  // Game over screen
  Button exitBtn;
  Button playAgainBtn;
  Button leaderBoardBtn;
  
  Input saveScoreInput;

  ArrayList<Button> allMultiTabelButtons = new ArrayList<Button>();

  Asteriodgame() {
    surface.setTitle("Matematik spil");
    frameRate(60);

    imageMode(CENTER);
    rectMode(CENTER);
    player = new Player();
    //level = new Level(player, 0);

    startBtn = new Button("Start", width/2, height/2, 100, 40);
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
    
    saveScoreInput = new Input(width/2, height/2, 200, 40);
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
    }
    
    if (showGameOverScreen == true && runGame == false) {
      if (saveScoreInput.clicked() == true && saveScoreInput.isActive == false) {
        saveScoreInput.setActive(true);
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
    
    textAlign(LEFT);
    
    saveScoreInput.display();
    
    exitBtn.display();
    playAgainBtn.display();
    leaderBoardBtn.display();
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
    
    if (showGameOverScreen == true && runGame == false) {
      saveScoreInput.update();
    }
  }

  void controlsReleased() {
    if (level.isLevelPaused == false) {
      player.controlsReleased();
    }
  }
}
