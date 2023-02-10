class SumOfMultiples {
  int sum(List<int> factors, int limit) {
    final cleaned = factors
        .where((factor) => factor < limit)
        .where((factor) => factor != 0);

    return List<int>.generate(limit, (number) => number)
        .where((number) => cleaned.any((factor) => number % factor == 0))
        .fold(0, (prev, curr) => prev + curr);
  }
}
