class ArmstrongNumbers {
  bool isArmstrongNumber(String s) {
    if (s.isEmpty) return false;

    final zero = BigInt.zero;
    final number = BigInt.tryParse(s) ?? zero;

    final numbers = s.split('').map(BigInt.tryParse).nonNulls;

    var value = zero;
    for (final n in numbers) {
      value += n.pow(numbers.length);
    }

    return number == value;
  }
}
