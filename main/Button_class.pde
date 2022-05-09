class Button extends Component {
  boolean isHidden = true;
  String text = "";

  Button(String text_, float x_, float y_, float w_, float h_) {
    text = text_;
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }

  void display() {
    if (isHidden == false) {
      fill(0);
      rect(x, y, w, h, 10);
      fill(255);
      textAlign(CENTER);
      textSize(18);
      stroke(255);
      strokeWeight(1);
      text(text, x, y + 7);
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
      if (mouseX >= (x - w/2) && mouseX <= (w + w/2) && mouseY >= (y - h/2) && mouseY <= (w + h/2)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
