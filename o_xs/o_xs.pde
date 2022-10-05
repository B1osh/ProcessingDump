void setup() {
  size(600, 600);
}

int[] cells = { 0, 0, 0, 0, 0, 0, 0, 0, 0 };
boolean isOTurn = true;

void draw() {

  background(255);
  stroke(0);
  strokeWeight(width/100);
  line(width/3, height/60, width/3, height - height/60);
  line(width*2/3, height/60, width*2/3, height - height/60);
  line(width/60, height/3, width - width/60, height/3);
  line(width/60, height*2/3, width - width/60, height*2/3);
  display();
  if (isOWin()) {
    println("O WINS");
  } else if (isXWin()) {
    println("X WINS");
  } else {
    println("--");
  }

  if (keyPressed && key == 'r') {
    for (int i = 0; i < 9; i++) {
      cells[i] = 0;
    }
    isOTurn = true;
  }
}


void display() {

  for (int i = 0; i < 9; i++) {

    float m = 0.0;
    float n = 0.0;

    switch(i) {
    case 0:
      m = width/6;
      n = height/6;
      break;
    case 1:
      m = width/2;
      n = height/6;
      break;
    case 2:
      m = width*5/6;
      n = height/6;
      break;
    case 3:
      m = width/6;
      n = height/2;
      break;
    case 4:
      m = width/2;
      n = height/2;
      break;
    case 5:
      m = width*5/6;
      n = height/2;
      break;
    case 6:
      m = width/6;
      n = height*5/6;
      break;
    case 7:
      m = width/2;
      n = height*5/6;
      break;
    case 8:
      m = width*5/6;
      n = height*5/6;
      break;
    }

    if (cells[i] == 1) {
      noFill();
      strokeWeight(width/50);
      stroke(0, 127, 255);
      ellipse(m, n, width/5, width/5);
    } else if (cells[i] == 2) {
      noFill();
      strokeWeight(width/50);
      stroke(255, 127, 0);
      line(m - width/10, n - width/10, m + width/10, n + width/10);
      line(m - width/10, n + width/10, m + width/10, n - width/10);
    }
  }
}


void mouseClicked() {

  int m = floor(map(mouseX, 0, width, 0, 3));
  int n = floor(map(mouseY, 0, height, 0, 3));
  int index = 0;

  if (n == 2) {
    index += 6;
  } else if (n == 1) {
    index += 3;
  }
  index += m;
  if (!isOWin() && !isXWin()) {
    if (isOTurn && cells[index] == 0) {
      cells[index] = 1;
      isOTurn = false;
    } else if (cells[index] == 0) {
      cells[index] = 2;
      isOTurn = true;
    }
  }
}


boolean isOWin() {

  for (int i = 0; i < 7; i += 3) {
    if (cells[i] == 1 && cells[i+1] == 1 && cells[i+2] == 1) {
      return true;
    }
  }
  for (int j = 0; j < 3; j++) {
    if (cells[j] == 1 && cells[j+3] == 1 && cells[j+6] == 1) {
      return true;
    }
  }
  if (cells[0] == 1 && cells[4] == 1 && cells[8] == 1) {
    return true;
  }
  if (cells[2] == 1 && cells[4] == 1 && cells[6] == 1) {
    return true;
  }

  return false;
}

boolean isXWin() {

  for (int i = 0; i < 7; i += 3) {
    if (cells[i] == 2 && cells[i+1] == 2 && cells[i+2] == 2) {
      return true;
    }
  }
  for (int j = 0; j < 3; j++) {
    if (cells[j] == 2 && cells[j+3] == 2 && cells[j+6] == 2) {
      return true;
    }
  }
  if (cells[0] == 2 && cells[4] == 2 && cells[8] == 2) {
    return true;
  }
  if (cells[2] == 2 && cells[4] == 2 && cells[6] == 2) {
    return true;
  }

  return false;
}
