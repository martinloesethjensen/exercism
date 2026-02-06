import 'dart:math';

class DifferenceOfSquares {
  num squareOfSum(int n) {
    var sum = 0;
    for (var i = 1; i <= n; i++) {
      sum += i;
    }
    return pow(sum, 2);
  }

  num sumOfSquares(int n) {
    var sum = 0;
    for (var i = 1; i <= n; i++) {
      sum += pow(i, 2).toInt();
    }
    return sum;
  }

  num differenceOfSquares(int i) => squareOfSum(i) - sumOfSquares(i);
}
