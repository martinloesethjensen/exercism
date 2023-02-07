import 'package:collection/collection.dart';

class Luhn {
  final nonDigitExp = RegExp(r'^\d+$');
  final nonSpaceExp = RegExp(r'\s+');
  bool valid(String s) {
    /// Strip spaces
    final str = s.replaceAll(nonSpaceExp, '');

    /// Need to have length more than 1 and have match for numbers only.
    if (str.length <= 1 || !nonDigitExp.hasMatch(str)) return false;

    /// Reverse and parse to int before mapping and
    /// doubling logic for the luhn algorithm.
    /// Then fold the values.
    final result = str
        .split('')
        .reversed
        .map((e) => int.parse(e))
        .mapIndexed((index, number) {
      if (index.isEven) return number;
      final doubled = number * 2;
      return doubled > 9 ? doubled - 9 : doubled;
    }).fold(0, (prev, curr) => prev + curr);

    return result % 10 == 0;
  }
}
