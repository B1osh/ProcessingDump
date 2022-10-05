//-----CHANGE IP HERE-----
String ip = "127.0.0.1";
//------------------------

import processing.net.*;

//CONSTANTS
final PVector gridOffset = new PVector(10, 10);
Client client;

//VARS
float tileWid = 80;
PImage[] PIKnight = new PImage[2];  //[white/black]
int[][] board = new int[8][8];  //-2 = visited, -1 = unvisited, 0 = white, 1 = black
int[][] activeSquares = new int[2][2];  //[white/black][x/y]
int player = -1;
boolean otherPlayer = false;
boolean moveMade = false;
int[] activeMove = {-1, -1};

void setup() {
  //Sketch Properties
  size(660, 660);
  rectMode(CORNERS);
  textAlign(CENTER, CENTER);
  client = new Client(this, ip, 5432);

  //IMAGES
  PIKnight[0] = loadImage("textures/wknight.png");
  PIKnight[0].resize(int(tileWid), int(tileWid));
  PIKnight[1] = loadImage("textures/bknight.png");
  PIKnight[1].resize(int(tileWid), int(tileWid));
  
  
}


void draw() {
  background(255);
  if(!client.active()) {
    println("Some error!");
    background(255, 0, 0);
    noLoop();
  }

  if (player == -1) {
    fill(0);
    text("No Connection", width/2, height/2);
  }else if(!otherPlayer) {
    fill(0);
    text("Waiting for other player", width/2, height/2);
  }else {
    showBoard();
    showKnights();
    showMove();
  }
  
  
}

void mousePressed() {
  int[] move = boardPress(board, activeSquares[player]);
  if(move[0] != -1 && !moveMade) {
    activeMove = move;
    moveMade = true;
    println(str(player) + "," + str(activeMove[0]) + "," + str(activeMove[1]));
    client.write(str(player) + "," + str(activeMove[0]) + "," + str(activeMove[1]));
  }
}

void keyPressed(){
  println(player);
}


void clientEvent(Client client) {
  String msg = client.readStringUntil('\n').trim();
  //println("msg:", msg);
  if (player == -1) {
    String[] msgA = split(msg, "#");
    player = int(msgA[0]);
    board = stringToBoard(msgA[1]);
    updateSquares(board, activeSquares);
    if(player == 1) {
      otherPlayer = true;
    }
  }else if(!otherPlayer) {
    otherPlayer = true;
  }else {
    board = stringToBoard(msg);
    updateSquares(board, activeSquares);
    moveMade = false;
    activeMove[0] = -1;
    activeMove[1] = -1;
  }
}
