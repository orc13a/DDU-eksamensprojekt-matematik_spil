class Level {
  Player player;

  ArrayList<TankStation> allTankStations = new ArrayList<TankStation>();
  ArrayList<Asteriod> allAsteriods = new ArrayList<Asteriod>();

  int tabel;
  int showQuestion;

  MathPopup question;

  boolean isLevelPaused = false;

  Level(Player p, int tabel_) {
    player = p;
    tabel = tabel_;
    
    question = new MathPopup(this);

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

    //try {
    question.display();
    //} 
    //catch(Exception e) {
    //}
  }

  void update() {
    for (TankStation t : allTankStations) {
      if (isLevelPaused == false) {
        t.update();
      }

      if (t.playerAtStation() == true && t.hasGivenFuel == false) {
        t.question.isDisplay = true;
        if (isLevelPaused == false) {
          isLevelPaused = true;
          player.isStoped = true;
          player.isBoosting = false;
        }

        if (t.question.AnwserButtonsClick() == "rigtig") {
          t.giveFuel();
          //t.hasGivenFuel = true; // For at fjerne den igen
          t.question.isDisplay = false;
          isLevelPaused = false;
        } else if (t.question.AnwserButtonsClick() == "forkert") {
          t.hasGivenFuel = true; // For at fjerne den igen
          t.question.isDisplay = false;
          isLevelPaused = false;
        }
      }
    }

    if (isLevelPaused == false) {
      player.update();

      for (Asteriod a : allAsteriods) {
        a.update();
      }

      if (frameCount % 360 == 0) {
        TankStation t = new TankStation(new PVector(random(50, width-50), random(0, -100)), player, this);
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

      if (frameCount % 120 == 0) {
        showQuestion = int(random(0, 20));
      }
    }

    if (showQuestion == 1 && isLevelPaused == false && frameCount > 240) {
      question = new MathPopup(this);
      question.isDisplay = true;
      isLevelPaused = true;
      player.isStoped = true;
      player.isBoosting = false;
    }

    if (isLevelPaused == true && frameCount > 240) {
      if (question.AnwserButtonsClick() == "rigtig") {
        player.bullets += 10;
        player.points += 100;
        question.isDisplay = false;
        isLevelPaused = false;
        showQuestion = 0;
      } else if (question.AnwserButtonsClick() == "forkert") {
        question.isDisplay = false;
        isLevelPaused = false;
      }
    }

    for (TankStation t : allTankStations) {
      t.question.display();
    }
  }

  void pauseLevel() {
    isLevelPaused = true;
  }

  void resumeLevel() {
    isLevelPaused = false;
  }
}
