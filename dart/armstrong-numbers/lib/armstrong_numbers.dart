class ArmstrongNumbers {
  bool isArmstrongNumber(String s) {
    final zero = BigInt.from(0);
    final number = BigInt.tryParse(s) ?? zero;

    /// Split String into list of BigInt
    final numbers = s
        .split('')
        .map(
          (numAsStr) => BigInt.tryParse(numAsStr) ?? zero,
        )
        .toList();

    /// Fold the numbers and add with pow.
    final value = numbers.fold(
      zero,
      (prevValue, value) => prevValue + value.pow(numbers.length),
    );

    return number == value;
  }
}
