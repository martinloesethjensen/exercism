class LargestSeriesProduct {
  int largestProduct(String input, int span) {
    if (span == 0) return 1;

    if (span > input.length)
      throw ArgumentError('span must be smaller than string length');

    if (span < 0) throw ArgumentError('span must not be negative');

    var largestProduct = 0;

    for (var i = 0; i <= input.length - span; i++) {
      final root = int.tryParse(input[i]);

      if (root == null)
        throw ArgumentError('digits input must only contain digits');

      if (root < 0) throw ArgumentError('span must not be negative');

      if (root == 0) continue;

      var result = root;

      for (var j = 1; j < span; j++) {
        final number = int.tryParse(input[i + j]);
        if (number == null) break;
        result *= number;
      }

      if (result > largestProduct) largestProduct = result;
    }

    return largestProduct;
  }
}
