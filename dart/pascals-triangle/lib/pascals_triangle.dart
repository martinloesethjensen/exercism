typedef Rows = List<List<int>>;

class PascalsTriangle {
  Rows rows(int rows) {
    if (rows <= 0) return Rows.empty();
    final Rows triangle = [
      [1],
    ];
    for (var i = 1; i < rows; i++) {
      final prevRow = triangle[i - 1];
      final currRow = [1];
      for (var j = 1; j < i; j++) {
        currRow.add(prevRow[j - 1] + prevRow[j]);
      }
      currRow.add(1);
      triangle.add(currRow);
    }
    return triangle;
  }
}
