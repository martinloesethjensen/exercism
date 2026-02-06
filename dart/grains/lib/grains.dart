BigInt square(final int n) {
  if (n <= 0 || n > 64) throw ArgumentError('square must be between 1 and 64');
  return BigInt.from(2).pow(n - 1);
}

BigInt total() => square(64) * BigInt.two - BigInt.one;
