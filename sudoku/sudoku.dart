void main() {
  List<List<int>> board = [
    [5, 1, 7, 6, 0, 0, 0, 3, 4],
    [2, 8, 9, 0, 0, 4, 0, 0, 0],
    [3, 4, 6, 2, 0, 5, 0, 9, 0],
    [6, 0, 2, 0, 0, 0, 0, 1, 0],
    [0, 3, 8, 0, 0, 6, 0, 4, 7],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 9, 0, 0, 0, 0, 0, 7, 8],
    [7, 0, 3, 4, 0, 0, 5, 6, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0],
  ];

  print('Given Board');
  printBoard(board);

  // Recursive backtrack solver. If solution exists =>
  if (solve(board, 0, 0)) {
    print('\nSolution Board');
    printBoard(board);
  }
  // If solution does not exist =>
  else {
    print('No solution exists');
  }
}

/// * Function to check if `num` is valid at `board[row][col]`
bool isValid(List<List<int>> board, int row, int col, int num) {
  for (int i = 0; i < 9; ++i) {
    /// Test 1: Check in row
    if (board[row][i] == num) return false;

    /// Test 2: Check in column
    if (board[i][col] == num) return false;
  }

  /// Test 3: Check in subgrid

  // Find topleft point of subgrid
  // (5,4) --~/3-> (1,1) --*3-> (3,3) => middle-center subgrid
  int rowStart = 3 * (row ~/ 3);
  int colStart = 3 * (col ~/ 3);

  for (var i = 0; i < 3; i++) {
    if (board[rowStart + i][colStart + i] == num) return false;
  }

  // All tests passed => `num` is valid at `board[row][col]`
  return true;
}

/// * Recursive function to backtrack and solve the board
bool solve(List<List<int>> board, int row, int col) {
  /// * If we're currently at the last cell => board is solved
  if (row == 9 && col == 9) {
    return true;
  }

  /// * If current cell is already filled => goto next cell
  if (board[row][col] != 0) {
    /// Goto next cell in row
    if ((col + 1) < 9) {
      return solve(board, row, col + 1);
    }

    /// Goto first cell in next row
    else if ((row + 1) < 9) {
      return solve(board, row + 1, 0);
    }
  }

  /// * If current cell is empty (0), make a valid guess
  else {
    for (int guess = 1; guess < 10; ++guess) {
      if (isValid(board, row, col, guess)) {
        board[row][col] = guess;

        /// Goto next cell in row
        if ((col + 1) < 9) {
          /// * Recursive call next cell
          if (solve(board, row, col + 1)) {
            return true;
          }

          /// * Backtrack if guess is incorrect
          else {
            board[row][col] = 0;
          }
        }

        /// Goto first cell in next row
        else if ((row + 1) < 9) {
          /// * Recursive call next cell
          if (solve(board, row + 1, 0)) {
            return true;
          }

          /// * Backtrack if guess is incorrect
          else {
            board[row][col] = 0;
          }
        }

        /// Catch final cell [9,9]
        else {
          return true;
        }
      }
    }
  }

  /// * Catch statement: after all backtracks and recursions, no solution
  return false;
}

/// * Formatted 9x9 board
void printBoard(List<List<int>> board) {
  String row = '';
  for (int i = 0; i < 9; i++) {
    for (int j = 0; j < 9; j++) {
      if (j % 3 == 0) row += ' |  ';
      row += board[i][j].toString();
      if (j == 8) row += '  |';
      row += ' ';
    }
    if (i % 3 == 0) print('----------------------------------');
    print(row);
    if (i == 8) print('----------------------------------');
    row = '';
  }
}
