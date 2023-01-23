import 'dart:math';

class PrimeFactors {
  List<int> factors(int i) {
    var number = i.abs();
    final factors = <int>[];

    for (int index = 2; index <= sqrt(number); index++) {
      while (number % index == 0) {
        factors.add(index);
        number = number ~/ index;
      }
    }

    if (number > 1) factors.add(number);

    return factors;
  }
}
