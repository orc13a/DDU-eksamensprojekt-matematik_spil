class Button extends Component {
  boolean isHidden = true;
  String text = "";
  
  int tabelValue = 0;

  Button(String text_, float x_, float y_, float w_, float h_) {
    text = text_;
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }

  void display() {
    if (isHidden == false) {
      rectMode(CENTER);
      fill(255);
      stroke(0);
      strokeWeight(1);
      rect(x, y, w, h, 10);
      fill(0);
      textAlign(CENTER);
      textSize(16);
      stroke(0);
      strokeWeight(1);
      text(text, x, y + 10);
      noStroke();
      textSize(12);
      textAlign(LEFT);
    }
  }

  void setHidden(boolean b) {
    isHidden = b;
  }

  boolean clicked() {
    if (mousePressed && isHidden == false) {
      if (mouseX >= (x - w/2) && mouseX <= (x + w/2) && mouseY >= (y - h/2) && mouseY <= (y + h/2)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
