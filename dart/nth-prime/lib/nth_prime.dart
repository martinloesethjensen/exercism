class NthPrime {
  int prime(int number) {
    if (number <= 0) throw ArgumentError('There is no zeroth prime');

    var i = 2;
    final primes = <int>[];

    while (primes.length != number) {
      if (isPrime(i)) primes.add(i);
      i++;
    }

    return primes.last;
  }

  bool isPrime(num number) {
    if (number <= 1) return false;

    for (int i = 2; i <= number; i++) {
      if (number == i) return true;

      if (number % i == 0) return false;
    }

    return false;
  }
}
