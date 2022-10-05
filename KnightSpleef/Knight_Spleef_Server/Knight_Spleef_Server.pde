import processing.net.*;

//CONSTANTS
final PVector gridOffset = new PVector(10, 10);
Server server;

//VARS
float tileWid = 70;
PImage[] PIKnight = new PImage[2];  //[white/black]
int[][] board = new int[8][9];  //-2 = visited, -1 = unvisited, 0 = white, 1 = black
int[][] activeSquares = new int[2][2];  //[white/black][x/y]
int[][] activeMoves = new int[2][2]; //[white/black][x/y]
int movesMade = 0;
boolean gameStarted = true;

void setup() {
  //Sketch Properties
  size(660, 660);
  rectMode(CORNERS);
  textAlign(CENTER, CENTER);
  server = new Server(this, 5432);

  //IMAGES
  PIKnight[0] = loadImage("textures/wknight.png");
  PIKnight[0].resize(int(tileWid), int(tileWid));
  PIKnight[1] = loadImage("textures/bknight.png");
  PIKnight[1].resize(int(tileWid), int(tileWid));

  //Initial Conditions
  //Board
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[0].length; j++) {
      board[i][j] = -1;
    }
  }
  //Knights/Players
  activeSquares[0][0] = 0;
  activeSquares[0][1] = 0;
  activeSquares[1][0] = 7;
  activeSquares[1][1] = 8;
  board[0][0] = 0;
  board[7][8] = 1;

  //~~Testing area~~
  //int[][] testA = {{2, 1}, {6, 5}};
  //if (isLegalMove(board, activeSquares[0], testA[0]) && isLegalMove(board, activeSquares[1], testA[1])) {
  //  makeMove(board, activeSquares, testA);
  //}
  //String testB = boardToString(board);
  //board = stringToBoard(testB);
}


void draw() {
  background(255);
  showBoard();
  showKnights();
  Client client = server.available();
  
  if(gameStarted && client != null) {
    receivingMoves(client);
  }else if (!gameStarted){
    fill(0);
    textSize(tileWid);
    text("PLAYERS IN: " + str(server.clientCount), width/2, height/2);
  }
}




void serverEvent(Server server, Client client) {
  println("Connection");
  if(server.clientCount > 2) {
    server.disconnect(client);
  }else{
  server.write(str(server.clientCount-1) + "#" + boardToString(board) + "\n");
  }
  if(server.clientCount == 2) {
    gameStarted = true;
  }
}

void disconnectEvent(Server server, Client client) {
  if(server.clientCount < 2) {
    println("Player disconnect - RESTART");
    server.stop();
    background(255,0,0);
    noLoop();
  }
}
