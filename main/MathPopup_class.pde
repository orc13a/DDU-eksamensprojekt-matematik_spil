class MathPopup extends Component {  
  String text = "";
  
  int answer;
  int answerBtnIndex;
  int tabel;
  
  ArrayList<Button> allAnswerButtons = new ArrayList<Button>();
  
  //Input input;
  
  MathPopup(String text_, int answer_, int tabel_) {
    x = width / 2;
    y = height / 2;
    w = 300;
    h = 200;
    text = text_;
    answer = answer_;
    tabel = tabel_;
    
    createAnswerButtons();
    
    //input = new Input(width / 2, height / 2, 200, 25);
    //input.setHidden(false);
    //input.setActive(true);
  }
  
  void display() {
    //stroke(0);
    //strokeWeight(1);
    //fill(255);
    //rect(x, y, w, h, 10);
    //noStroke();
    //fill(0);
    //textSize(20);
    //textAlign(CENTER);
    //text(text, x, y - 50);
    //textAlign(LEFT);
    //textSize(12);
    
    //input.display();
    
    for (Button b : allAnswerButtons) {
      b.display();
    }
  }
  
  void update() {
    for (int i = 0; i < allAnswerButtons.size(); i++) {
      Button b = allAnswerButtons.get(i);

      if (b.clicked() == true) {
        if (i == answerBtnIndex) {
          println("c");
        } else {
          println("f");
        }
      }
    }
    
    //if (input.clicked() == true) {
    //  input.setActive(true);
    //} else {
    //  input.setActive(false);
    //}
    //input.update();
    //input.input();
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
