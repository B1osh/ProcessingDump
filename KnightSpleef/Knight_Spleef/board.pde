void showBoard() {
  noStroke();
  fill(0);
  rect(gridOffset.x-1, gridOffset.y-1, gridOffset.x+tileWid*board.length+1, gridOffset.y+tileWid*board[0].length+1);
  for (int i = 0; i < board.length; i++) {
    for (int j = 0; j < board[0].length; j++) {
      if (board[i][j] != -2) {
        if ((i+j)%2 == 0) {
          fill(255, 255, 220);
        } else {
          fill(20, 220, 20);
        }
      } else {
        fill(127);
      }
      rect(gridOffset.x+i*tileWid, gridOffset.y+j*tileWid, gridOffset.x+(i+1)*tileWid, gridOffset.y+(j+1)*tileWid);
      fill(0);
      text(str(i) + ',' + str(j), gridOffset.x+(i+0.5)*tileWid, gridOffset.y+(j+0.5)*tileWid);
    }
  }
}

void showKnights() {
  image(PIKnight[0], gridOffset.x+activeSquares[0][0]*tileWid, gridOffset.y+activeSquares[0][1]*tileWid);
  image(PIKnight[1], gridOffset.x+activeSquares[1][0]*tileWid, gridOffset.y+activeSquares[1][1]*tileWid);
}

void showMove() {
  noStroke();
  fill(127, 120);
  ellipse(gridOffset.x+(activeMove[0]+0.5)*tileWid, gridOffset.y+(activeMove[1]+0.5)*tileWid, tileWid/3, tileWid/3);
}

int[][] stringToBoard(String thisString) {
  String[] cols = split(thisString, "|");
  int[][] returnBoard = new int[cols.length][split(cols[0], ",").length];
  for (int i = 0; i < cols.length; i++) {
    String[] col = split(cols[i], ",");
    for (int j = 0; j < col.length; j++) {
      returnBoard[i][j] = int(col[j]);
    }
  }
  return returnBoard;
}

void updateSquares(int[][] thisBoard, int[][] thisSquares) {
  int squaresFound = 0;
  for (int i = 0; i < thisBoard.length; i++) {
    for (int j = 0; j < thisBoard[0].length; j++) {
      if (thisBoard[i][j] >= 0) {
        int[] tempSquare = {i, j};
        thisSquares[thisBoard[i][j]] = tempSquare;
        squaresFound++;
      }
      if (squaresFound == 2) {
        return;
      }
    }
  }
}


int[] boardPress(int[][] thisBoard, int[] thisSquare) {
  int[] returnSquare = {-1, -1};

  if (mouseX > gridOffset.x && mouseY > gridOffset.y) {
    for (int i = 0; i < thisBoard.length; i++) {
      for (int j = 0; j < thisBoard[0].length; j++) {
        if (mouseX < gridOffset.x + (i+1)*tileWid && mouseY < gridOffset.y + (j+1)*tileWid) {
          int[] move = {i, j};
          if (isLegalMove(thisBoard, thisSquare, move)) {
            returnSquare[0] = i;
            returnSquare[1] = j;
          }
          return returnSquare;
        }
      }
    }
  }

  return returnSquare;
}
