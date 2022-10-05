PVector[] tiles = new PVector[30 * 16];
int[] tiletype = new int[30 * 16]; //number of bombs surrounding the tile. -1 = bomb
boolean[] iscovered = new boolean[30 * 16];
boolean[] isflagged = new boolean[30 * 16];
boolean isdead = false;
int stillcovered = 0;
int flagged = 0;

void setup() {
  size(800, 500); 
  noStroke();
  for(int i = 0; i < iscovered.length; i++){
    iscovered[i] = true;
  }
  mines();
  tiles();
  reset();
}

void draw() {
  display();
  zeroclicked();
  checkwin();
  
  if(keyPressed && key == 'r'){
    reset();
  }
}
