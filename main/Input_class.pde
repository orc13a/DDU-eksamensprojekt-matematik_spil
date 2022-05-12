class Input extends Component {
  boolean isActive = false;
  boolean showBlinkCursor = true;
  boolean isHidden = true;

  String userInput = "";
  
  int maxLength;

  Input(float x_, float y_, float w_, float h_, int maxLength_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    maxLength = maxLength_;
  }

  void display() {
    if (isHidden == false) {
      fill(255);
      stroke(0);
      strokeWeight(1);
      rect(x, y, w, h, 10);
      fill(0);
      
      textAlign(CENTER);
      //if (userInput.length() == 0 && isActive == false) {
      //  text("Skriv svar her", x, y + 8);
      //}
      text(userInput, x, y + 8);
      textAlign(LEFT);
      
      InputCursor();
    }
  }
  
  void update() {
    input();
  }

  void input() {
    if (isHidden == false && isActive == true && keyPressed) {
      if (key == BACKSPACE && key != ENTER && userInput.length() > 0) {
        userInput = userInput.substring(0, userInput.length() - 1);
      } else if (key != BACKSPACE && key != ENTER && userInput.length() < maxLength) {
        userInput += key;
      }
    }
  }

  void InputCursor() {
    if (isActive == true && isHidden == false) {
      if (frameCount % 40 == 0) {
        if (showBlinkCursor == true) {
          showBlinkCursor = false;
        } else {
          showBlinkCursor = true;
        }
      }

      if (showBlinkCursor == true) {
        stroke(0);
        strokeWeight(1);
        line(x + (textWidth(userInput) / 2) + 3, y - 10, x + (textWidth(userInput) / 2) + 3, y + 10);
      }
    }
  }
  
  void setHidden(boolean b) {
    isHidden = b;
  }
  
  void setActive(boolean b) {
    isActive = b;
  }

  boolean clicked() {
    //if (mousePressed && isHidden == false) {
      if (mousePressed && mouseX >= (x - w/2) && mouseX <= (x + w/2) && mouseY >= (y - h/2) && mouseY <= (y + h/2)) {
        return true;
      } else {
        return false;
      }
    }
    //else {
      //return false;
    //}
  //}
}
