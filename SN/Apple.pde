class Apple {

  int posX;
  int posY;

  int wid;
  float m;
  color col;

  float offX;
  float offY;

  Apple() {
    init(new Snake());
  }
  
  Apple(Snake s) {
    init(s);
  }

  void init(Snake s) {

    reset(s);
    wid = min(width/gridW, height/gridH);
    offX = 0.5*(width-wid*gridW);
    offY = 0.5*(height-wid*gridH);
    m = 0.7;
    col = #F57029;
  }


  void reset(Snake s) {
    posX = randomInt(gridW);
    posY = randomInt(gridH);
    while (checkApplePos(s)) {
      posX = randomInt(gridW);
      posY = randomInt(gridH);
    }
  }
  
  void display() {
    fill(col);
    rect(offX + (0.5+posX)*wid, offY + (0.5+posY)*wid, m*wid, m*wid);
  }
  
  boolean checkApplePos(Snake s) {
    for (int i = 0; i < s.len; i++) {
      if(posX == s.x.get(i) && posY == s.y.get(i)) return true;
    }
    return false;
  }
  
  
}
