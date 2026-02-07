class EggCounter {
  int count(int i) {
    if (i == 0) return 0;
    var result = 0;
    while (i > 0) {
      final remainder = i % 2;
      if (remainder == 1) result++;
      i ~/= 2;
    }
    return result;
  }
}
