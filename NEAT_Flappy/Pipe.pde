class Pipe {
  
  float spacing = 150;
  float top;
  float x;
  
  boolean onScreen = true;
  
  Pipe(float topLip) {
    top = topLip;
    x = width;
  }
  
  void show() {
    fill(0);
    rect(x, 0, 50, top);
    rect(x, top + spacing, 50, height - (top-spacing));
  }
  
  void update() {
    x -= 5;
    onScreen = x > -50;
    show();
  }
}