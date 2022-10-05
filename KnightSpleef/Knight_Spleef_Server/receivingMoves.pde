
void receivingMoves(Client thisClient) {
  String[] income = thisClient.readString().split(",");
  int player = int(income[0]);
  int[] move = {int(income[1]), int(income[2])};
  println(move[0], move[1]);
  activeMoves[player] = move;
  movesMade++;

  if (movesMade == 2) {
    println("HERE!");
    makeMove(board, activeSquares, activeMoves);
    movesMade = 0;
    server.write(boardToString(board) + "\n");
  }
}
