import 'dart:math';

class DifferenceOfSquares {
  num squareOfSum(int i) {
    return pow(
      List.generate(i, (index) => index + 1).fold(0, (prev, cur) => prev + cur),
      2,
    );
  }

  num sumOfSquares(int i) {
    return List.generate(i, (index) => index + 1).reduce(
      (value, element) => value + pow(element, 2).toInt(),
    );
  }

  num differenceOfSquares(int i) => squareOfSum(i) - sumOfSquares(i);
}
