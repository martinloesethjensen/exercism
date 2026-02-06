class DifferenceOfSquares {
  num squareOfSum(int i) {
    final sum = i * (i + 1) ~/ 2;
    return sum * sum;
  }

  num sumOfSquares(int i) => i * (i + 1) * (2 * i + 1) ~/ 6;

  num differenceOfSquares(int i) => squareOfSum(i) - sumOfSquares(i);
}
