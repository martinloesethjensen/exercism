class Triangle {
  bool equilateral(num a, num b, num c) {
    if (isInequal(a, b, c)) return false;

    return [a, b, c].cleaned.length == 1;
  }

  bool isosceles(num a, num b, num c) {
    if (isInequal(a, b, c)) return false;

    return [a, b, c].cleaned.length < 3;
  }

  bool scalene(num a, num b, num c) {
    if (isInequal(a, b, c)) return false;

    return [a, b, c].cleaned.length == 3;
  }

  bool isInequal(num a, num b, num c) =>
      !(a + b >= c && b + c >= a && a + c >= b);
}

extension on List<num> {
  Iterable<num> get cleaned => where((e) => e > 0).toSet();
}
