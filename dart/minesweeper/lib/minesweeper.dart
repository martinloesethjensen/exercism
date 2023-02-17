class Minesweeper {
  final List<String> board;

  Minesweeper(this.board);

  List<String> get annotated {
    if (board.hasNoMines || board.hasNoBlanks) return board;
    final result = <String>[];
    for (var y = 0; y < board.length; y++) {
      final line = board[y];

      var lineResult = '';

      for (var x = 0; x < line.length; x++) {
        var mineCount = 0;

        if (line[x].isBlank) {
          if (y >= 1) {
            final oneUpY = board[y - 1];
            if (x >= 1) {
              if (oneUpY[x - 1].isMine) mineCount++;
            }
            if (oneUpY[x].isMine) mineCount++;
            if (x < line.length - 1) {
              if (oneUpY[x + 1].isMine) mineCount++;
            }
          }

          if (x >= 1) {
            if (line[x - 1].isMine) mineCount++;
          }

          if (x < line.length - 1) {
            if (line[x + 1].isMine) mineCount++;
          }

          if (y < board.length - 1) {
            final oneDownY = board[y + 1];
            if (x >= 1) {
              if (oneDownY[x - 1].isMine) mineCount++;
            }
            if (oneDownY[x].isMine) mineCount++;
            if (x < line.length - 1) {
              if (oneDownY[x + 1].isMine) mineCount++;
            }
          }
        }

        lineResult = lineResult + (mineCount == 0 ? board[y][x] : '$mineCount');
      }

      result.add(lineResult);
    }

    return result;
  }
}

extension on String {
  bool get isBlank => trim().isEmpty;
  bool get isMine => this == '*';
}

extension on List<String> {
  bool get hasNoMines => !any((element) => element.contains('*'));
  bool get hasNoBlanks => !any((element) => element.contains(' '));
}
