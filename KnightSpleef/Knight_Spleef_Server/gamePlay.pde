
boolean isLegalMove(int[][] thisBoard, int[] thisSquare, int[] thisMove) {

  //Tests that the square is within the board
  if (thisMove[0] < 0 || thisMove[0] > thisBoard.length
    || thisMove[1] < 0 || thisMove[1] > thisBoard[0].length) {
    return false;
  }

  //Tests that the square is available
  if (thisBoard[thisMove[0]][thisMove[1]] != -1) {
    return false;
  }

  //Tests that the square is a knight's move away
  if (dist(thisSquare[0], thisSquare[1], thisMove[0], thisMove[1]) != dist(0, 0, 1, 2)) {
    return false;
  }

  return true;
}


void makeMove(int[][] thisBoard, int[][] thisSquares, int[][] thisMoves) {
  if(thisMoves[0][0] == thisMoves[1][0] && thisMoves[0][1] == thisMoves[1][1]) {
    println("we doid it");
    thisBoard[thisMoves[0][0]][thisMoves[0][1]] = -2;
    return;
  }
  for (int i = 0; i < 2; i++) {
    thisBoard[thisSquares[i][0]][thisSquares[i][1]] = -2;
    thisSquares[i][0] = thisMoves[i][0];
    thisSquares[i][1] = thisMoves[i][1];
    thisBoard[thisSquares[i][0]][thisSquares[i][1]] = i;
  }
}

int[][] getLegalMoves(int[][] thisBoard, int[] thisSquare) {
  int[][] moves = {
    {2, 1}, 
    {2, -1}, 
    {-2, 1}, 
    {-2, -1}, 
    {1, 2}, 
    {1, -2}, 
    {-1, 2}, 
    {-1, -2}
  };

  ArrayList<Integer[]> returnMoves = new ArrayList<Integer[]>(8);
  for (int i = 0; i < 8; i++) {
    int[] tempMove = {thisSquare[0] + moves[i][0], thisSquare[1] + moves[i][1]};
    if (isLegalMove(thisBoard, thisSquare, tempMove)) {
      Integer[] tempArray = {thisSquare[0] + moves[i][0], thisSquare[1] + moves[i][1]};
      returnMoves.add(tempArray);
    }
  }

  int[][] returnArray = new int[returnMoves.size()][2];
  for (int i = 0; i < returnArray.length; i++) {
    returnArray[i][0] = returnMoves.get(i)[0];
    returnArray[i][1] = returnMoves.get(i)[1];
  }

  return returnArray;
}
