class CollatzConjecture {
  int steps(int n) {
    if (n <= 0) throw ArgumentError('Only positive integers are allowed');

    var steps = 0;
    var result = n;

    while (result != 1) {
      result = result.isEven ? result ~/ 2 : 3 * result + 1;
      steps++;
    }

    return steps;
  }
}
