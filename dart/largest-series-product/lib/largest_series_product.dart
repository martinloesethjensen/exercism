import 'dart:math';

class LargestSeriesProduct {
  int largestProduct(String input, int span) {
    if (span == 0) return 1;

    if (span > input.length)
      throw ArgumentError('span must be smaller than string length');

    if (span < 0) throw ArgumentError('span must not be negative');

    final numbers = input.split("").map((char) {
      final number = int.tryParse(char);
      if (number == null)
        throw ArgumentError('digits input must only contain digits');
      return number;
    }).toList();

    var largestProduct = 0;

    for (var i = 0; i <= input.length - span; i++) {
      final number = numbers[i];

      if (number < 0) throw ArgumentError('span must not be negative');

      if (number == 0) continue;

      var result = number;

      for (var j = 1; j < span; j++) {
        result *= numbers[i + j];
      }

      largestProduct = max(largestProduct, result);
    }

    return largestProduct;
  }
}
