class DifferenceOfSquares {
  num squareOfSum(int n) {
    var sum = 0;
    for (var i = 1; i <= n; i++) {
      sum += i;
    }
    return sum * sum;
  }

  num sumOfSquares(int n) {
    var sum = 0;
    for (var i = 1; i <= n; i++) {
      sum += (i * i);
    }
    return sum;
  }

  num differenceOfSquares(int i) => squareOfSum(i) - sumOfSquares(i);
}
