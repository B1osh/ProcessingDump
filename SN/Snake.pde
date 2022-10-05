
class Snake {

  ArrayList<Integer> x;
  ArrayList<Integer> y;
  int len;
  int dir;
  int freq;
  int tick;
  boolean isAlive;

  int wid;
  float m;
  color col;
  color headCol;

  float offX;
  float offY;


  Snake() {
    init();
  }


  void init() {
    x = new ArrayList<Integer>();
    y = new ArrayList<Integer>();
    for (int i = 0; i < 5; i++) {
      x.add(floor(gridW/2));
      y.add(floor(gridH/2));
    }
    reset();
    freq = 5;
    tick = 0;
    wid = min(width/gridW, height/gridH);
    offX = 0.5*(width-wid*gridW);
    offY = 0.5*(height-wid*gridH);
    m = 0.8;
    headCol = #65AFFF;
    col = #62929E;
  }

  void reset() {
    len = 5;
    dir = 0;
    tick = 0;
    isAlive = true;
    x.clear();
    y.clear();
    x.add(floor(gridW/2));
    y.add(floor(gridH/2));
    for (int i = 1; i < len; i++) {
      x.add(-1);
      y.add(-1);
    }
  }

  void display() {
    
    fill(col);
    for (int i = 1; i < len-1; i++) {
      rect(offX +(0.5+x.get(i))*wid, offY + (0.5+y.get(i))*wid, m*wid, m*wid);
    }
    
    rect(offX +(0.5+x.get(len-1))*wid, offY + (0.5+y.get(len-1))*wid, m*m*wid, m*m*wid);
    fill(headCol);
    rect(offX + (0.5+x.get(0))*wid, offY + (0.5+y.get(0))*wid, m*wid, m*wid);

    fill(#C6C5B9);
    textSize(max(offX, offY)*0.5);
    text("Score: " + str(len), max(offX*0.5, offY*0.5), max(offX*0.5, offY*0.5));
    
  }

  void move() {
    if (tick < freq || !isAlive) {
      tick++;
      return;
    }
    for (int i = len-1; i > 0; i--) {
      x.set(i, x.get(i-1));
      y.set(i, y.get(i-1));
    }

    switch(dir) {
    case 0:
      y.set(0, (y.get(0)+gridH-1) % gridH);
      break;
    case 1:
      x.set(0, (x.get(0)+1) % gridW);
      break;
    case 2:
      y.set(0, (y.get(0)+1) % gridH);
      break;
    case 3:
      x.set(0, (x.get(0)+gridW-1) % gridW);
      break;
    }
    tick = 0;
  }

  void death() {
    for (int i = 1; i < len; i++) {
      if (x.get(0) == x.get(i) && y.get(0) == y.get(i)) {
        isAlive = false;
        break;
      }
    }
  }

  void eat(Apple a) {
    if (x.get(0) == a.posX && y.get(0) == a.posY) {
      x.add(-1);
      y.add(-1);
      len++;
      a.reset(this);
    }
  }


  void turn() {
    if(!keyPressed) return;
    if ( dir % 2 == 0) {
      if (keyCode == RIGHT) dir = 1;
      if (keyCode == LEFT) dir = 3;
    } else {
      if (keyCode == UP) dir = 0;
      if (keyCode == DOWN) dir = 2;
    }
  }

  void work(Apple a) {
    if (isAlive) {
      turn();
      move();
      eat(apple);
      death();
    } else if (keyPressed) {
      reset();
      a.reset(this);
    }
    display();
    a.display();
  }
}
