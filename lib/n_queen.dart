void main(){
  solveNQueens(8);
}

List<List<String>> solveNQueens(int n){
  //initialize the board
  final List<List<String>> board = List.generate(n, (_) => List<String>.filled(n, '.'));
  final List<List<String>> ans = [];

  backtracking(board,ans,0,n);
  return ans;
}

void backtracking(List<List<String>> board,List<List<String>> ans ,int row, int queens){
  //if all queens are placed, add the board to the answer
  if (row == queens) {
    ans.add(convert(board));
    return;
  }
  //try to place the queen in each column
  for (int col = 0; col < board.length; col++) {
    //check if the queen can be placed
    if (isValid(board, row, col)) {
      board[row][col] = 'Q';
      //place the next queen
      backtracking(board, ans, row + 1, queens);
      board[row][col] = '.';
    }
  }
}

bool isValid(List<List<String>> board, int row, int col) {

  for (int i = 0; i < row; i++) {
    if (board[i][col] == 'Q') {
      return false;
    }
  }

  for (int i = row, j = col; i >= 0 && j >= 0; i--, j--) {
    if (board[i][j] == 'Q') {
      return false;
    }
  }

  for (int i = row, j = col; i >= 0 && j < board.length; i--, j++) {
    if (board[i][j] == 'Q') {
      return false;
    }
  }

  return true;

}

List<String> convert(List<List<String>> board) {
  final List<String> ans = [];
  //
  for (int i = 0; i < board.length; i++) {
    //
    final row = board[i].join('');
    ans.add(row);
  }

  return ans;
}