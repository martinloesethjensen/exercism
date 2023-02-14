typedef Rows = List<List<int>>;

class PascalsTriangle {
  Rows rows(int rows) => List.generate(
        rows,
        (outerIndex) => List.generate(
          outerIndex + 1,
          (innerIndex) => pascalFormula(outerIndex, innerIndex),
        ),
      );

  int factorial(int n) => n == 0 ? 1 : n * factorial(n - 1);

  int pascalFormula(int n, int k) =>
      factorial(n) ~/ (factorial(k) * factorial(n - k));
}
