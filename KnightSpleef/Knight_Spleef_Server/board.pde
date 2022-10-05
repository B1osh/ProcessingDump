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
      textSize(tileWid/8);
      text(str(i) + ',' + str(j), gridOffset.x+(i+0.5)*tileWid, gridOffset.y+(j+0.5)*tileWid);
    }
  }
}

void showKnights() {
  image(PIKnight[0], gridOffset.x+activeSquares[0][0]*tileWid, gridOffset.y+activeSquares[0][1]*tileWid);
  image(PIKnight[1], gridOffset.x+activeSquares[1][0]*tileWid, gridOffset.y+activeSquares[1][1]*tileWid);
}


String boardToString(int[][] thisBoard) {
  String returnString = "";
  for (int i = 0; i < thisBoard.length; i++) {
    for (int j = 0; j < thisBoard[0].length; j++) {
      returnString += str(thisBoard[i][j]) + ",";
    }
    returnString = returnString.substring(0, returnString.length() - 1) + "|";
  }
  returnString = returnString.substring(0, returnString.length() - 1);
  return returnString;
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
