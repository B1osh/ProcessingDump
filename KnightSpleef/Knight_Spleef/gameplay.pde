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
