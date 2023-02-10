import 'dart:math';

class Darts {
  static final _centerPoint = Point(0, 0);

  int score(num x, num y) {
    final units = Point(x, y).distanceTo(_centerPoint);
    if (units <= 1) return 10;
    if (units <= 5) return 5;
    if (units <= 10) return 1;
    return 0;
  }
}
