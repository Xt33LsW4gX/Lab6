class Portal {
  float x, y, w, h, r;

  Portal(float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
    r = h/2;
  }
  
  void display() {
    stroke(0);
    fill (127, 127, 127, 127);
    
    ellipse(x, y, w, h);
  }
}