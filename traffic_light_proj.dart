enum Player{
  player1('Player 1'),
  player2('Player 2'),
  player0('Player 0');


  final String str;

  const Player(this.str);

  @override
  String toString() => str;
}

class TrafficLightsState {
  int rows = 3;
  int cols = 4;
  int numCells = 12;
  int currentPlayer = 1;
  List<String> board = List.filled(12, 'C'); // 'C' represents an// empty cell

  bool gameOver = false;

  void move(int index) {
    if (!gameOver) {
      if (board[index] == 'C') {
        board[index] = 'G';
        currentPlayer = currentPlayer == 1 ? 2 : 1;
      } else if (board[index] == 'G') {
        board[index] = 'Y';
        currentPlayer = currentPlayer == 1 ? 2 : 1;
      } else if (board[index] == 'Y') {
        board[index] = 'R';
        currentPlayer = currentPlayer == 1 ? 2 : 1;
      }
    }
  }

  void checkWinner() {
    for (int i = 0; i < numCells; i += cols) {
      for (int j = 0; j <= cols - 3; j++) {
        if (board[i + j] != 'C' &&
            board[i + j] == board[i + j + 1] &&
            board[i + j + 1] == board[i + j + 2]) {
          gameOver = true;
          return;
        }
      }
    }

    for (int i = 0; i < cols; i++) {
      for (int j = 0; j <= numCells - cols * 3; j += cols) {
        if (board[i + j] != 'C' &&
            board[i + j] == board[i + j + cols] &&
            board[i + j + cols] == board[i + j + cols * 2]) {
          gameOver = true;
          return;
        }
      }
    }

    for (int i = 0; i <= numCells - 3 * cols; i += cols) {
      for (int j = 0; j <= cols - 3; j++) {
        if (board[i + j] != 'C' &&
            board[i + j] == board[i + j + cols + 1] &&
            board[i + j + cols + 1] == board[i + j + 2 * cols + 2]) {
          gameOver = true;
          return;
        }
        if (board[i + j + 2] != 'C' &&
            board[i + j + 2] == board[i + j + cols + 1] &&
            board[i + j + cols + 1] == board[i + j + 2 * cols]) {
          gameOver = true;
          return;
        }
      }
    }
  }

  void reset() {
    board = List.filled(12, 'C');
    gameOver = false;
    currentPlayer = 1;
  }

  String getStatus() {
    if (gameOver) {
      return 'Player $currentPlayer wins!';
    } else {
      return 'Player $currentPlayer\'s turn';
    }
  }
}
