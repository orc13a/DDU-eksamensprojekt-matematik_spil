class MathPopup extends Component {
  Level level;

  String text = "Hvad er ";

  int answer;
  int answerBtnIndex;
  int tabel;

  Button b;

  ArrayList<Button> allAnswerButtons = new ArrayList<Button>();

  boolean isDisplay = false;

  //Input input;

  MathPopup(Level l) {
    x = width / 2;
    y = height / 2;
    w = 300;
    h = 200;
    tabel = level.tabel;
    level = l;

    int multiNmb = int(random(1, 11));

    text += str(tabel) + " × " + str(multiNmb) + " ?";
    answer = (tabel * multiNmb);

    createAnswerButtons();
  }

  void display() {
    if (isDisplay == true) {
      stroke(0);
      strokeWeight(1);
      fill(255);
      rect(x, y, w, h, 10);
      noStroke();
      fill(0);
      textSize(20);
      textAlign(CENTER);
      text(text, x, y - 50);
      textAlign(LEFT);
      textSize(12);

      for (Button b : allAnswerButtons) {
        b.display();
      }
    }
  }

  void update() {
    //if (isDisplay == true) {
    //  for (int i = 0; i < allAnswerButtons.size(); i++) {
    //    Button b = allAnswerButtons.get(i);

    //    if (b.clicked() == true) {
    //      if (i == answerBtnIndex) {
    //        println("c");
    //      } else {
    //        println("f");
    //        isDisplay = false;
    //        level.resumeLevel();
    //      }
    //    }
    //  }
    //}
  }

  String AnwserButtonsClick() {
    if (isDisplay == true) {
      Button b1 = allAnswerButtons.get(0);
      Button b2 = allAnswerButtons.get(1);
      Button b3 = allAnswerButtons.get(2);

      if (b1.clicked() == true) {
        if (0 == answerBtnIndex) {
          return "rigtig";
        } else {
          return "forkert";
        }
      } else if (b2.clicked() == true) {
        if (1 == answerBtnIndex) {
          return "rigtig";
        } else {
          return "forkert";
        }
      } else if (b3.clicked() == true) {
        if (2 == answerBtnIndex) {
          return "rigtig";
        } else {
          return "forkert";
        }
      } else {
        return " ";
      }
    } else {
      return " ";
    }
  }

  void createAnswerButtons() {
    answerBtnIndex = int(random(0, 3));

    for (int i = 0; i < 3; i++) {
      int falseAnswer = tabel * int(random(1, 11));
      Button b = new Button(str(falseAnswer), (150 + (i + 1) * 75), (height/2) + 50, 45, 45);
      b.setHidden(false);

      if (i == answerBtnIndex) {
        b.text = str(answer);
      }

      allAnswerButtons.add(b);
    }
  }
}
